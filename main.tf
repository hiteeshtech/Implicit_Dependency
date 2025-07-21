terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f96f2e3b-2cc8-4e5e-8ed9-4afb664bb5a8"
}

resource "azurerm_resource_group" "rg" {
  name     = "hiteshrg"
  location = "East US"
}

resource "azurerm_storage_account" "stg" {
  name                     = "hiteshstgacc"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}