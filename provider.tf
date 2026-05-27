terraform {
    required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

data "template_file" "prefix" {
  template = file("C:\\Users\\Adin\\Documents\\azure_access_24022025\\prefix")
}

data "template_file" "client_id" {
  template = file("C:\\Users\\Adin\\Documents\\azure_access_24022025\\client_id")
}

data "template_file" "tenant_id" {
  template = file("C:\\Users\\Adin\\Documents\\azure_access_24022025\\tenant_id")
}

data "template_file" "sub_id" {
  template = file("C:\\Users\\Adin\\Documents\\azure_access_24022025\\sub_id")
}

provider "azurerm" {
  features {}
  client_certificate_path = "C:\\Users\\Adin\\Documents\\azure_access_24022025\\samssl.pfx"
  subscription_id = "${trimspace(data.template_file.sub_id.rendered)}"
  client_id = "${trimspace(data.template_file.client_id.rendered)}"
  tenant_id = "${trimspace(data.template_file.tenant_id.rendered)}"
}
