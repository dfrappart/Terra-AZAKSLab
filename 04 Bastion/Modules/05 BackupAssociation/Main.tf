########################################################################
#This module creates the association of a VM with a target backup Policy
########################################################################

locals {
  PolicyId = "${var.environmentTag == "prd" ? var.ProdPolicyId : var.NonProdPolicyId}"
}

# RecoveryVault Policy Association

resource "azurerm_recovery_services_protected_vm" "ProtectedVM" {
  resource_group_name = var.RGRecoveryVaultName
  recovery_vault_name = var.RecoveryVaultName
  source_vm_id        = var.VMId
  backup_policy_id    = local.PolicyId

    tags = {
      application       = var.applicationTag
      costcenter        = var.costcenterTag
      businessunit       = var.businessunitTag
      managedby         = var.managedbyTag
      environvment      = var.environmentTag
      hostname          = var.hostnameTag
      owner             = var.ownerTag
      role              = var.roleTag
      createdby         = var.createdbyTag
      backup            = var.backupTag
    }
}
