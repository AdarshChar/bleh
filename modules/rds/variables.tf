variable "project_name" { type = string }
variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "public_subnet_ids" {
  type        = list(string)
  default     = []
  description = "Public subnet IDs. Required if publicly_accessible is true."
}

variable "db_engine" { type = string }
variable "db_engine_version" { type = string }
variable "db_instance_class" { type = string }
variable "db_allocated_storage" { type = number }
variable "db_name" { type = string }
variable "db_username" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_port" { type = number }

variable "allowed_cidr_blocks" { type = list(string) }

variable "apply_schema" {
  type    = bool
  default = true
}
variable "schema_file_path" { type = string }
variable "db_sslmode" {
  type    = string
  default = "require"
}
variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Whether the RDS instance should be publicly accessible. Set to true only for testing if you cannot reach the private endpoint."
}