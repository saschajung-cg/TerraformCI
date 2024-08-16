terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "Capgemini_SJ"
    workspaces {
      name = "remotestate"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  location = "Germany West Central"
  name     = "terraform_rg"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountsj"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  resource_group_name      = azurerm_resource_group.rg.name
}
