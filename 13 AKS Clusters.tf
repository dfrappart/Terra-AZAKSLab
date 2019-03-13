######################################################################
# RG for AKS managed cluster
######################################################################

# Creating the ResourceGroups

module "ResourceGroupAKS" {
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"

  #Module variable
  RGName              = "${var.RGName}"
  RGLocation          = "${var.AzureRegion}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"

}

######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################



module "AKSClus" {
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//44 AKS Cluster/"

  #Module variable
  AKSRGName           = "${var.RGName}"
  AKSClusName         = "${var.AKSName}"
  AKSprefix           = "${var.AKSName}"
  AKSLocation         = "${var.AzureRegion}"
  AKSSubnetId         = "${module.AKS_Subnet.Id}"
  K8SSPId             = "${var.AKSSP_AppId}"
  K8SSPSecret         = "${var.AKSSP_Secret}"
  AADTenantId         = "${var.AzureTenantID}"
  AADServerAppSecret  = "${var.AKSAADAppServer_AppSecret}"
  AADServerAppId      = "${var.AKSAADAppServer_AppId}"
  AADCliAppId         = "${var.AKSAADAppClient_AppId}"
  AKSLAWId            = "${module.AKSWorkspace.Id}"
  PublicSSHKey        = "${var.AzurePublicSSHKey}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
  IsRBACEnable        = "${var.AKSRBACEnabled}"

}

module "AKSClusNoRbac" {
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//44 AKS Cluster/"

  #Module variable
  AKSRGName           = "${var.RGName}"
  AKSClusName         = "${var.AKSName}NoRbac"
  AKSprefix           = "${var.AKSName}"
  AKSLocation         = "${var.AzureRegion}"
  AKSSubnetId         = "${module.AKSNoRbac_Subnet.Id}"
  K8SSPId             = "${var.AKSSP_AppId}"
  K8SSPSecret         = "${var.AKSSP_Secret}"
  AADTenantId         = "${var.AzureTenantID}"
  AADServerAppSecret  = "${var.AKSAADAppServer_AppSecret}"
  AADServerAppId      = "${var.AKSAADAppServer_AppId}"
  AADCliAppId         = "${var.AKSAADAppClient_AppId}"
  AKSLAWId            = "${module.AKSWorkspace.Id}"
  PublicSSHKey        = "${var.AzurePublicSSHKey}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
  IsRBACEnable        = "false"

}