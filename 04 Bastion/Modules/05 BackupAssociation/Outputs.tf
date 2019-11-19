########################################################################
#This module creates the association of a VM with a target backup Policy
########################################################################


# Module output

output "VMBackupAssociationId" {
  value = azurerm_recovery_services_protected_vm.ProtectedVM.id
}
