# tf-aws-rds-schema-test

Creates:
- VPC with Internet Gateway (if public subnets are configured)
- Private subnets (default for RDS)
- Public subnets (optional, for publicly accessible RDS)
- RDS Postgres instance (test)
- Security Group (minimal inbound)
- Applies a SQL schema after DB creation using null_resource + local-exec (psql)

## Prereqs
- Terraform >= 1.6
- AWS credentials configured (env vars, profile, SSO, etc.)
- `psql` installed locally
  - **macOS**: `brew install postgresql@16` or `brew install libpq && brew link --force libpq`
  - **Ubuntu/Debian**: `sudo apt-get install postgresql-client`
  - **RHEL/CentOS**: `sudo yum install postgresql`
  - **Windows**: Download from https://www.postgresql.org/download/windows/ or use `choco install postgresql`
- **Network Access Options:**
  - **Private (default)**: DB is in private subnets (`publicly_accessible=false`). The machine running Terraform must be able to reach the VPC privately:
    - Run Terraform from inside the VPC (bastion/jump host), OR
    - VPN/DirectConnect, OR
    - Port-forwarding via SSM to a host inside the VPC.
  - **Public (testing only)**: Set `publicly_accessible = true` in `schema-test.auto.tfvars`. This requires:
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

## Quick start
1) Put your schema here:
- `./schemas/schema.sql`

2) Update `schema-test.auto.tfvars` (especially db_password)

3) Init/Apply:
```bash
terraform init
terraform apply
