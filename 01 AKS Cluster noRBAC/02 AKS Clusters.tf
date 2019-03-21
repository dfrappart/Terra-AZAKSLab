######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################

module "AKSClusterRandomPrefix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "5"
    stringspecial       = "false"
    stringupper         = "false"
    
}



module "AKSClusNoRbac" {
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//44 AKS Cluster/"

  #Module variable
  AKSRGName           = "${data.azurerm_resource_group.AKSRG.name}"
  AKSClusName         = "${var.AKSClusterName}"
  AKSprefix           = "${module.AKSClusterRandomPrefix.Result}"
  AKSLocation         = "${var.AzureRegion}"
  AKSSubnetId         = "${data.azurerm_subnet.AKSNoRBACSubnet.id}"
  K8SSPId             = "${data.azurerm_key_vault_secret.AKSSP_AppId.value}"
  K8SSPSecret         = "${data.azurerm_key_vault_secret.AKSSP_AppSecret.value}"
  AKSLAWId            = "${data.azurerm_log_analytics_workspace.AKSLabWS.id}"
  PublicSSHKey        = "${data.azurerm_key_vault_secret.SSHPublicKey.value}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
  AKSSVCCIDR          = "${var.AKSSVCIPRange}"
  AKSDockerBridgeCIDR = "${var.AKSDockerBridgeAddress}"


}

