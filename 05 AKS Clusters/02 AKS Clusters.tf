######################################################################
# RG for AKS managed cluster
######################################################################

# Creating the ResourceGroups

module "ResourceGroupAKS" {
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGAKSName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}

module "AKSClusterRandomPrefix" {
  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"
  source = "./Modules/00 RandomString"

  #Module variables
  stringlenght  = "4"
  stringspecial = "false"
  stringupper   = "false"
  stringnumber  = "false"
}

######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################

module "AKSClus" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//44-2 AKS ClusterwithRBAC/"
  source = "./Modules/44-2 AKS ClusterwithRBAC"

  #Module variable
  AKSRGName           = module.ResourceGroupAKS.Name
  AKSClusName         = var.AKSClus
  AKSprefix           = module.AKSClusterRandomPrefix.Result
  AKSLocation         = var.AzureRegion
  AKSSubnetId         = data.azurerm_subnet.AKSNodePool1Subnet.id
  K8SSPId             = data.azurerm_key_vault_secret.AKSSP_AppId.value
  K8SSPSecret         = data.azurerm_key_vault_secret.AKSSP_AppSecret.value
  AKSLAWId            = data.azurerm_log_analytics_workspace.AKSLabWS.id
  IsOMSAgentEnabled   = var.IsOMSAgentEnabled
  AADTenantId         = var.AzureTenantID
  AADServerAppSecret  = data.azurerm_key_vault_secret.AKS_AADServer_AppSecret.value
  AADServerAppId      = data.azurerm_key_vault_secret.AKS_AADServer_AppID.value
  AADCliAppId         = data.azurerm_key_vault_secret.AKS_AADClient_AppId.value
  PublicSSHKey        = data.azurerm_key_vault_secret.SSHPublicKey.value
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

  #the following parameters are optional because defined with default values
  AKSSVCCIDR          = "172.19.0.0/16"
  AKSDockerBridgeCIDR = "172.17.0.1/16"

  #New stuff for AKS
  AKSAZ               = var.AKSAZ
  EnablePodPolicy     = var.EnablePodPolicy
  AKSNodesRG          = var.AKSNodesRG
  AKSNodePoolType     = var.AKSNodePoolType
  AKSLBSku            = var.AKSLBSku
  EnableAKSAutoScale  = var.EnableAKSAutoScale
  MinAutoScaleCount   = var.MinAutoScaleCount
  MaxAutoScaleCount   = var.MaxAutoScaleCount

  KubeVersion         = var.KubeVersion


}

