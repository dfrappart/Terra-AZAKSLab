######################################################
# This file get a secret in a previously deployed
# keyvault and use the value to populate the VM 
#Password Value
######################################################

######################################################
# This file creates an Azure VM
######################################################


module "WinVMBastion" {
  #Module location
  source = "./Modules//01 WinVM"

  #Module variable
  AzureRegion                     = var.AzureRegion
  RGVMRole                        = var.RGVMRole
  ASGRole                         = var.ASGRole
  VMPIPRole                       = var.VMPIPRole
  NICRole                         = var.NICRole
  VMRole                          = var.VMRole
  VMAdminName                     = var.VMAdminName
  VMSize                          = var.VMSize
  VMPublisherName                 = var.VMPublisherName
  VMOffer                         = var.VMOffer
  VMsku                           = var.VMsku
  VMStorageTier                   = var.Manageddiskstoragetier
  OSDisksize                      = var.OSDisksize
  VMDiskRole                      = var.VMDiskRole
  CloudinitscriptPath             = var.CloudinitscriptPath
  VMAdminPassword                 = data.azurerm_key_vault_secret.VMPassword.value
  SubnetId                        = data.azurerm_subnet.BastionSubnet.id
  DiagnosticDiskURI               = data.azurerm_storage_account.DiagSta.primary_blob_endpoint
  VMZone                          = var.VMZone
  RGNSGReference                  = data.azurerm_resource_group.RGHub.name
  NSGReference                    = data.azurerm_network_security_group.BastionNSG.name
  applicationTag                  = var.applicationTag
  costcenterTag                   = var.costcenterTag
  businessunitTag                 = var.businessunitTag
  managedbyTag                    = var.managedbyTag
  environmentTag                  = var.environmentTag
  hostnameTag                     = var.hostnameTag
  ownerTag                        = var.ownerTag
  roleTag                         = var.roleTag
  createdbyTag                    = var.createdbyTag


} 



module "WinVMNSGRuleRDP" {

  #Module location
  source = "./Modules/03-3 NSGRule with Dest ASG"

  #Module variable

  NSGRuleName                   = "AllowIngressRDP"
  NSGRulePriority               = "1000"
  NSGRuleDirection              = "Inbound"
  NSGRuleAccess                 = "Allow"
  NSGRuleProtocol               = "tcp"
  NSGRuleSourcePortRange        = "*"
  NSGRuleDestinationPortRange   = "3389"
  RGName                        = data.azurerm_resource_group.RGHub.name
  NSGReference                  = data.azurerm_network_security_group.BastionNSG.name
  NSGRuleSourceAddressPrefix    = "Internet"
  NSGRuleDestinationASG         = [module.WinVMBastion.VMASGId]



}


module "WinVMNSGRuleSSH" {

  #Module location
  source = "./Modules/03-3 NSGRule with Dest ASG"

  #Module variable

  NSGRuleName                   = "AllowIngressSSH"
  NSGRulePriority               = "1001"
  NSGRuleDirection              = "Inbound"
  NSGRuleAccess                 = "Allow"
  NSGRuleProtocol               = "tcp"
  NSGRuleSourcePortRange        = "*"
  NSGRuleDestinationPortRange   = "22"
  RGName                        = data.azurerm_resource_group.RGHub.name
  NSGReference                  = data.azurerm_network_security_group.BastionNSG.name
  NSGRuleSourceAddressPrefix    = "Internet"
  NSGRuleDestinationASG         = [module.WinVMBastion.VMASGId]



}

module "WinVMNSGRuleEgressInternet" {

  #Module location
  source = "./Modules/03-5 NSGRule with source ASG"

  #Module variable

  NSGRuleName                         = "AllowEgressInternetBastion"
  NSGRulePriority                     = "1000"
  NSGRuleDirection                    = "Outbound"
  NSGRuleAccess                       = "Allow"
  NSGRuleProtocol                     = "tcp"
  NSGRuleSourcePortRange              = "*"
  NSGRuleDestinationPortRange         = "*"
  RGName                              = data.azurerm_resource_group.RGHub.name
  NSGReference                        = data.azurerm_network_security_group.BastionNSG.name
  NSGRuleDestinationAddressPrefix     = "Internet"
  NSGRuleSourceASG                    = [module.WinVMBastion.VMASGId]



}


/*
module "BackupConfigVMhub" {

  #Module location
  source = "./Modules/05 BackupAssociation"

  #Module variable

  ProdPolicyId             = data.terraform_remote_state.RecoveryVaultState.outputs.PolicyProdId
  NonProdPolicyId          = data.terraform_remote_state.RecoveryVaultState.outputs.PolicyNonProdId
  RGRecoveryVaultName      = data.terraform_remote_state.RecoveryVaultState.outputs.RGRecoverySVCName
  RecoveryVaultName        = data.terraform_remote_state.RecoveryVaultState.outputs.RecoveryVaultName
  VMId                     = module.WinVMBastion.VMId
  applicationTag           = var.applicationTag
  longcodeTag              = var.longcodeTag
  costcenterTag            = var.costcenterTag
  businessunitTag          = var.businessunitTag
  managedbyTag             = var.managedbyTag
  environmentTag           = var.environmentTag
  hostnameTag              = var.hostnameTag
  ownerTag                 = var.ownerTag
  roleTag                  = var.roleTag
  createdbyTag             = var.createdbyTag

} 

*/