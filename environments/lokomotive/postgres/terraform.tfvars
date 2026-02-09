aws_region  = "ca-central-1"
aws_profile = ""

project_name = "lokomotive-postgres"

vpc_cidr = "10.60.0.0/16"

private_subnet_cidrs = [
  "10.60.1.0/24",
  "10.60.2.0/24",
]

public_subnet_cidrs = [
  "10.60.10.0/24",
  "10.60.11.0/24",
]

az_names = [
  "ca-central-1a",
  "ca-central-1b",
]

allowed_cidr_blocks = ["10.60.0.0/16"]

db_engine   = "postgres"
db_name     = "lokomotive"
db_username = "lokomotive_admin"
db_password = "REPLACE_ME"

apply_schema     = false
schema_file_path = "schemas/lokomotive/postgres/lokomotive_schema.sql"

publicly_accessible = false
