# tf-aws-rds-schema-test

Creates:
- VPC with Internet Gateway (if public subnets are configured)
- Private subnets (default for RDS)
- Public subnets (optional, for publicly accessible RDS)
- RDS instance (Postgres / MySQL / SQL Server)
- Security Group (minimal inbound)
- Optionally applies a SQL schema after DB creation using null_resource + local-exec (Postgres/MySQL only)

## Prereqs
- Terraform >= 1.6
- AWS credentials configured (env vars, profile, SSO, etc.)
- `psql` installed locally (for Postgres schema apply)
  - **macOS**: `brew install postgresql@16` or `brew install libpq && brew link --force libpq`
  - **Ubuntu/Debian**: `sudo apt-get install postgresql-client`
  - **RHEL/CentOS**: `sudo yum install postgresql`
  - **Windows**: Download from https://www.postgresql.org/download/windows/ or use `choco install postgresql`
- `mysql` client installed locally (for MySQL schema apply)
  - **macOS**: `brew install mysql-client`
  - **Ubuntu/Debian**: `sudo apt-get install mysql-client`
  - **RHEL/CentOS**: `sudo yum install mysql`
  - **Windows**: `choco install mysql`
- **Network Access Options:**
  - **Private (default)**: DB is in private subnets (`publicly_accessible=false`). The machine running Terraform must be able to reach the VPC privately:
    - Run Terraform from inside the VPC (bastion/jump host), OR
    - VPN/DirectConnect, OR
    - Port-forwarding via SSM to a host inside the VPC.
  - **Public (testing only)**: Set `publicly_accessible = true` in your environment tfvars file. This requires:
    - `public_subnet_cidrs` configured in tfvars
    - Your public IP added to `allowed_cidr_blocks`
    
    **To get your public IP:**
    ```bash
    curl -s https://checkip.amazonaws.com
    ```
    
    **Add it to `allowed_cidr_blocks` with `/32` suffix:**
    ```hcl
    allowed_cidr_blocks = ["10.50.0.0/16", "YOUR_PUBLIC_IP/32"]
    ```
    
    The `/32` means a single IP address (your current public IP). **Note:** Your public IP may change if you switch networks or your ISP rotates IPs. If connection fails, check and update your IP in the tfvars file.
    
    ⚠️ **WARNING**: Making RDS publicly accessible is **NOT recommended for production**. Only use for testing/development.

## Environment layout (per app, per engine)
Create a separate environment for each app and database engine:
```
environments/
  lokomotive/
    postgres/terraform.tfvars
    mysql/terraform.tfvars
    sqlserver/terraform.tfvars
```

Run Terraform from the repo root and point to the engine-specific var file:
```bash
terraform init
terraform plan -var-file=environments/lokomotive/postgres/terraform.tfvars
terraform apply -var-file=environments/lokomotive/postgres/terraform.tfvars
```

Schema files are expected under `schemas/<app>/<engine>/...` (not committed here). To validate a schema:
- Set `apply_schema = true`
- Set `schema_file_path` to the schema file you want to validate

Note: SQL Server schema application is not automated in this repo. Keep `apply_schema = false` and apply manually.

## Quick start
1) Update an environment tfvars file (especially `db_password`)

2) Init/Plan/Apply:
```bash
terraform init
terraform plan -var-file=environments/lokomotive/postgres/terraform.tfvars
terraform apply -var-file=environments/lokomotive/postgres/terraform.tfvars
```
