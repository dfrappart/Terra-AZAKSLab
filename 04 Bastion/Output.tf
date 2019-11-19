######################################################
# This file defines which value are sent to output
######################################################

######################################################
# Resource group info Output

output "RGHubName" {
  value = data.azurerm_resource_group.RGHub.name
}

output "RGHubId" {
  value = data.azurerm_resource_group.RGHub.id
  sensitive = true
}


output "RGKeyVaultName" {
  value = data.azurerm_resource_group.KeyVaultRG.name
}

output "RGKeyVaultId" {
  value = data.azurerm_resource_group.KeyVaultRG.id
  sensitive = true
}

######################################################
# VNet info Output

output "HubName" {
  value = data.azurerm_virtual_network.VNetHub.name
}

output "HubId" {
  value = data.azurerm_virtual_network.VNetHub.id
  sensitive = true
}

######################################################
# Subnet info Output

output "BastionSubnetName" {
  value = data.azurerm_subnet.BastionSubnet.name
}

output "BastionSubnetId" {
  value = data.azurerm_subnet.BastionSubnet.id
  sensitive = true
}

/*
output "SharedSVCSubnetName" {
  value = data.azurerm_subnet.SharedSVCSubnet.name
}

output "SharedSVCSubnetId" {
  value = data.azurerm_subnet.SharedSVCSubnet.id
  sensitive = true
}

*/
######################################################
# NSG info Output

output "BastionNSGId" {
  value = data.azurerm_network_security_group.BastionNSG.id
  sensitive = true
}
/*
output "SharedSVCNSGId" {
  value = data.azurerm_network_security_group.SharedSVCNSG.id
  sensitive = true
}

*/
######################################################
# Key Vault Output info Output

output "KeyVaultName" {
  value = data.azurerm_key_vault.Keyvault.name
}

output "KeyVaultId" {
  value = data.azurerm_key_vault.Keyvault.id
  sensitive = true
}

output "KeyVaultSecretName" {
  value = data.azurerm_key_vault_secret.VMPassword.name
}

output "KeyVaultSecretId" {
  value = data.azurerm_key_vault_secret.VMPassword.id
  sensitive = true
}
/*
output "KeyVaultSecretValue" {
  value = data.azurerm_key_vault_secret.VMPassword.value
  sensitive = true
}
*/
#########################################################
#VM outputs

output "RGVMName" {
    value = module.WinVMBastion.RGVMName
}

output "RGVMId" {
    value = module.WinVMBastion.RGVMId
    sensitive = true
}

output "RGVMLocation" {
    value = module.WinVMBastion.RGVMLocation
}


output "VMPIPId" {
    value = module.WinVMBastion.VMPIPId
}

output "VMPIPFQDN" {
    value = module.WinVMBastion.VMPIPFQDN
}

output "VMNICId" {
    value = module.WinVMBastion.VMNICId
}

output "VMNICIPConfig" {
    value = module.WinVMBastion.VMNICIPConfig
}

output "VMASGId" {
    value = module.WinVMBastion.VMASGId
    sensitive = true
}

output "VMASGName" {
    value = module.WinVMBastion.VMASGName
}

output "VMId" {
    value = module.WinVMBastion.VMId
    sensitive = true
}

output "VMName" {
    value = module.WinVMBastion.VMName
}