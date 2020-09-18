module "hmcts-webchat" {
  source              = "../../modules/azure-public-dns/"
  zone_name           = azurerm_dns_zone.hmcts-webchat.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}