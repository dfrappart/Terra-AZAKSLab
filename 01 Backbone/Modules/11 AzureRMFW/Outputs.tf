##############################################################
#This module allows the creation of Route table
##############################################################


#Output

output "FWName" {
  value = azurerm_firewall.TerraFirewall.name
}

output "FWId" {
  value = azurerm_firewall.TerraFirewall.id
}

output "FWRGName" {
  value = azurerm_firewall.TerraFirewall.resource_group_name
}

output "FWIPConfig" {
  value = azurerm_firewall.TerraFirewall.ip_configuration
}


output "FWIPName" {
  value = azurerm_public_ip.TerraZRPIPFW.name
}

output "FWIPId" {
  value = azurerm_public_ip.TerraZRPIPFW.id
}

/*
output "IPAddresses" {

  value = [azurerm_public_ip.TerraPublicIPZoneRedundant.*.ip_address]
}
*/
output "FWIPfqdn" {
  value = azurerm_public_ip.TerraZRPIPFW.fqdn
}

