output "vpc_id" { value = module.vpc.vpc_id }
output "private_subnet_ids" { value = module.vpc.private_subnet_ids }

output "db_endpoint" { value = module.rds.db_endpoint }
output "db_port" { value = module.rds.db_port }
output "db_name" { value = var.db_name }
output "db_username" { value = var.db_username }
