######################################################################
# This module create a Windows VM
######################################################################

output "RGVMName" {
    value = azurerm_resource_group.RGVM.name
}

output "RGVMId" {
    value = azurerm_resource_group.RGVM.id
}

output "RGVMLocation" {
    value = azurerm_resource_group.RGVM.location
}


output "VMPIPId" {
    value = azurerm_public_ip.VMPublicIPZoneRedundant.id
}

output "VMPIPFQDN" {
    value = azurerm_public_ip.VMPublicIPZoneRedundant.fqdn
}

output "VMNICId" {
    value = azurerm_network_interface.VMNIC.id
}

output "VMNICIPConfig" {
    value = azurerm_network_interface.VMNIC.ip_configuration
}

output "VMASGId" {
    value = azurerm_application_security_group.ASGVM.id
    sensitive = true
}

output "VMASGName" {
    value = azurerm_application_security_group.ASGVM.name
}

output "VMId" {
    value = azurerm_virtual_machine.TerraVMWithoutDataDisk.id
    sensitive = true
}

output "VMName" {
    value = azurerm_virtual_machine.TerraVMWithoutDataDisk.name
}