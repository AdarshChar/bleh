variable "aws_region" { type = string }
variable "aws_profile" {
  type    = string
  default = ""
}

variable "project_name" {
  type    = string
  default = "schema-test"
}

# Networking
variable "vpc_cidr" { type = string }
variable "private_subnet_cidrs" { type = list(string) }
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = []
  description = "Public subnet CIDRs. Required if publicly_accessible RDS is needed."
}

# No data source: pass AZs from auto.tfvars
variable "az_names" {
  type        = list(string)
  description = "AZs aligned with private_subnet_cidrs length (e.g., [\"ca-central-1a\",\"ca-central-1b\"])"
}

# DB
variable "db_engine" {
  type    = string
  default = "postgres"
  validation {
    condition     = contains(["postgres", "mysql"], var.db_engine)
    error_message = "Supported engines are 'postgres' or 'mysql'."
  }
}
variable "db_engine_version" {
  type    = string
  default = "16.6"
}
locals {
  # If the user didn't specify a version, pick the right one for the engine
  default_version = var.db_engine_version != null ? var.db_engine_version : (var.db_engine == "postgres" ? "16.6" : "8.0.35")

  # Logic for Port
  actual_port = var.db_port != null ? var.db_port : (var.db_engine == "postgres" ? 5432 : 3306)
}

variable "db_instance_class" {
  type    = string
  default = "db.t4g.micro"
}
variable "db_allocated_storage" {
  type    = number
  default = 20
}
variable "db_name" {
  type    = string
  default = "schematest"
}
variable "db_username" {
  type    = string
  default = "schemaadmin"
}
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_port" {
  type    = number
  default = 5432
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "CIDRs allowed inbound to DB SG (must be private/VPN/VPC CIDR if DB is private)."
}

# Schema apply
variable "apply_schema" {
  type    = bool
  default = true
}
variable "schema_file_path" {
  type    = string
  default = "schemas/aukai_23_dump/skyit_demo_1_schema.sql"
}
variable "db_sslmode" {
  type    = string
  default = "require"
}
variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Whether the RDS instance should be publicly accessible. Set to true only for testing if you cannot reach the private endpoint."
}