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
    condition = contains(
      ["postgres", "mysql", "sqlserver-ex", "sqlserver-web", "sqlserver-se", "sqlserver-ee"],
      var.db_engine
    )
    error_message = "Supported engines are 'postgres', 'mysql', or SQL Server variants: 'sqlserver-ex', 'sqlserver-web', 'sqlserver-se', 'sqlserver-ee'."
  }
}
variable "db_engine_version" {
  type    = string
  default = null
  description = "Optional engine version. If null, defaults are used for Postgres/MySQL; SQL Server uses the AWS default."
}

variable "db_instance_class" {
  type    = string
  default = null
  description = "Instance class. If null, a per-engine default is selected."
}
variable "db_allocated_storage" {
  type    = number
  default = 20
}
variable "db_name" {
  type    = string
  default = "schematest"
  description = "Initial database name (not used by SQL Server engines)."
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
  default = null
  description = "Optional override for DB port. If null, engine defaults are used."
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "CIDRs allowed inbound to DB SG (must be private/VPN/VPC CIDR if DB is private)."
}

# Schema apply
variable "apply_schema" {
  type    = bool
  default = false
}
variable "schema_file_path" {
  type    = string
  default = null
  description = "Path to the schema file to apply when apply_schema is true."
  validation {
    condition     = var.apply_schema ? (var.schema_file_path != null && length(trim(var.schema_file_path)) > 0) : true
    error_message = "schema_file_path must be set when apply_schema is true."
  }
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