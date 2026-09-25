terraform {
  # Remote state in the pre-created state storage account (see README's
  # "One-time Azure/GitHub setup"). Auth comes from ARM_* environment
  # variables set by the calling GitHub Actions workflow (OIDC) — nothing
  # subscription-specific is hardcoded here.
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "saterraformstorage13579"
    container_name        = "tfstate"
    key                    = "azure_sql_database/sqlserver-createdby-agent-7801-kilanitestsqldb.tfstate"
    use_oidc               = true
    # Without this, the backend defaults to fetching the storage account's
    # shared access key (listKeys) to read/write state instead of using the
    # already-authenticated OIDC identity — which would need a much broader,
    # secret-based grant. This makes it actually use the Storage Blob Data
    # Contributor role already assigned to the pipeline identity.
    use_azuread_auth        = true
  }
}
