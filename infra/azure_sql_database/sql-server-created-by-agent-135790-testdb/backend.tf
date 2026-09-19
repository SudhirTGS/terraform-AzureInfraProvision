terraform {
  # Remote state in the pre-created state storage account (see README's
  # "One-time Azure/GitHub setup"). Auth comes from ARM_* environment
  # variables set by the calling GitHub Actions workflow (OIDC) — nothing
  # subscription-specific is hardcoded here.
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "saterraformstorage13579"
    container_name        = "tfstate"
    key                    = "azure_sql_database/sql-server-created-by-agent-135790-testdb.tfstate"
    use_oidc               = true
  }
}
