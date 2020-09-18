module "ctsc-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.ctsc-hmcts-config.content).cname
  zone_name           = azurerm_dns_zone.ctsc-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}