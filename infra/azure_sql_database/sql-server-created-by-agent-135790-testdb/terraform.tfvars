resource_group    = "rg-infra-agent-workloads"
region            = "centralus"
sql_server_name   = "sql-server-created-by-agent-135790"
database_name     = "testdb"
edition           = "GeneralPurpose"
service_objective = "GP_Gen5_2"
license_type      = "BasePrice"
environment_tag   = "dev"
max_size_gb       = 32
backup_redundancy = "Local"
firewall_rules    = []

# sql_admin_password is intentionally NOT set here — it's sensitive. Supply
# it via the TF_VAR_sql_admin_password environment variable at apply time.
