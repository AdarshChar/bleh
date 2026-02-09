resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "DB SG - minimal inbound"
  vpc_id      = var.vpc_id

  ingress {
    description = "Postgres from allowed CIDRs"
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    description = "Allow all egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.project_name}-db-sg", Project = var.project_name }
}

locals {
  # Determine which subnets to use based on publicly_accessible setting
  db_subnet_ids = var.publicly_accessible && length(var.public_subnet_ids) > 0 ? var.public_subnet_ids : var.private_subnet_ids
  # Create a hash of subnet IDs to force RDS recreation when subnets change
  subnet_ids_hash = md5(join(",", local.db_subnet_ids))
}

# Trigger resource to force RDS recreation when subnet selection changes
resource "null_resource" "subnet_trigger" {
  triggers = {
    subnet_ids_hash = local.subnet_ids_hash
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = local.db_subnet_ids
  tags       = { Name = "${var.project_name}-db-subnets", Project = var.project_name }
}

locals {
  # If the user didn't specify a version, pick the right one for the engine
  default_version = var.db_engine_version != null ? var.db_engine_version : (var.db_engine == "postgres" ? "16.6" : "8.0.35")

  # Logic for Port
  actual_port = var.db_port != null ? var.db_port : (var.db_engine == "postgres" ? 5432 : 3306)
}

resource "aws_db_instance" "this" {
  identifier              = "${var.project_name}-rds"
  engine                  = var.db_engine
  engine_version          = local.default_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  port                    =local.actual_port

  vpc_security_group_ids  = [aws_security_group.db.id]
  db_subnet_group_name    = aws_db_subnet_group.this.name

  publicly_accessible     = var.publicly_accessible
  multi_az                = false

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true

  apply_immediately       = true

  tags = { Name = "${var.project_name}-rds", Project = var.project_name }

  lifecycle {
    # Force RDS instance recreation when subnet IDs change (required when switching between private/public subnets)
    replace_triggered_by = [
      null_resource.subnet_trigger.id
    ]
  }
}

resource "null_resource" "apply_schema" {
  count = var.apply_schema ? 1 : 0

  triggers = {
    schema_sha1 = filesha1(var.schema_file_path)
    db_endpoint = aws_db_instance.this.address
    db_name      = var.db_name
    db_user      = var.db_username
    db_port      = tostring(var.db_port)
    engine       = var.db_engine
  }

  depends_on = [aws_db_instance.this]

  provisioner "local-exec" {
    # -lc ensures your WSL profile (and aliases) are loaded
    interpreter = ["/bin/bash", "-lc"]
    
    # Pass passwords for both possible clients
    environment = { 
      PGPASSWORD = var.db_password 
      MYSQL_PWD  = var.db_password
    }

    command = <<EOT
set -euo pipefail

if [ "${var.db_engine}" == "postgres" ]; then
    echo "Detected Postgres. Applying schema..."
    
    # Check for psql
    if ! command -v psql &> /dev/null; then
        echo "Error: psql not found. Run: sudo apt install postgresql-client"
        exit 1
    fi

    psql "host=${aws_db_instance.this.address} port=${local.actual_port} dbname=${var.db_name} user=${var.db_username} sslmode=${var.db_sslmode}" \
      -v ON_ERROR_STOP=1 \
      -f "${var.schema_file_path}"

elif [ "${var.db_engine}" == "mysql" ]; then
    echo "Detected MySQL. Applying schema..."
    
    # Check for mysql
    if ! command -v mysql &> /dev/null; then
        echo "Error: mysql client not found. Run: sudo apt install mysql-client"
        exit 1
    fi

    # MySQL uses -h for host, -P for port, and < for the file input
    mysql -h ${aws_db_instance.this.address} -P ${local.actual_port} -u ${var.db_username} ${var.db_name} < "${var.schema_file_path}"

else
    echo "Error: Unsupported engine ${var.db_engine}"
    exit 1
fi

echo "Schema applied successfully."
EOT
  }
}