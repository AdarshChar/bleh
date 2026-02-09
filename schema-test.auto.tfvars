# Example only. Prefer environments/<app>/<engine>/terraform.tfvars.
aws_region  = "ca-central-1"
aws_profile = ""

project_name = "schema-test"

vpc_cidr = "10.50.0.0/16"

private_subnet_cidrs = [
  "10.50.1.0/24",
  "10.50.2.0/24",
]

public_subnet_cidrs = [
  "10.50.10.0/24",
  "10.50.11.0/24",
]

az_names = [
  "ca-central-1a",
  "ca-central-1b",
]

allowed_cidr_blocks = ["10.50.0.0/16", "73.95.10.29/32", "70.65.110.144/32"]

db_password = "password"

# Schema apply is optional; enable only when validating a schema file.
apply_schema     = false
schema_file_path = "schemas/schema.sql"

# WARNING: Setting publicly_accessible = true makes the RDS instance accessible from the internet.
# Only use this for testing. For production, use a bastion host, VPN, or SSM port forwarding.
publicly_accessible = true
