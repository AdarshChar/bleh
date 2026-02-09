# LokoMotive RDS environments

This app should be validated against the database engine that matches its schema.
Use the matching folder:
- `postgres/terraform.tfvars`
- `mysql/terraform.tfvars`
- `sqlserver/terraform.tfvars`

Each file includes placeholders for networking and credentials. Update values as needed.

Schema validation:
- Set `apply_schema = true`
- Point `schema_file_path` at the one schema you want to validate

SQL Server schema application is not automated in this repo. Keep `apply_schema = false`
and apply the schema manually when validating.

Database requirements (fill in when known):
- Engine: postgres / mysql / sqlserver-*
- Engine version: optional (use AWS default or set explicitly)
- Schema to validate: `schemas/lokomotive/<engine>/<schema>.sql` (not in repo)
