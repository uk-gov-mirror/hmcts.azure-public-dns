resource "azurerm_dns_zone" "sftp-hmcts" {
  name                = "sftp.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "local_file" "sftp-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/sftp-hmcts-net.yml"
}

module "sftp-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.sftp-hmcts-config.content).cname
  a_recordsets        = yamldecode(data.local_file.sftp-hmcts-config.content).A
  zone_name           = azurerm_dns_zone.sftp-hmcts.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}