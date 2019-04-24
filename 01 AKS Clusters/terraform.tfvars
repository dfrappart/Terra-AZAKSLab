######################################################################
# This file references the VM B sizes
######################################################################

AzureRegion                 = "westeurope"
RGInfraName                 = "RG_Infra"
RGAKSName                   = "RG_AKSManagedCluster"
AKSVNet                     = "VNetSpoke1"
AKSSubnet                   = "AKS_Subnet2_VNetSpoke1"
#KeyVaultName                = "oh0pfkeyvault"
KeyVault_AKS_SP_AppId       = "AKSSPAppId"
KeyVault_AKS_SP_AppSecret   = "AKSSPSecret"
KeyVault_AKS_SRVAppId       = "AKSAADAppServerId"
KeyVault_AKS_SRVAppSecret   = "AKSAADAppServerSecret"
KeyVault_AKS_CliAppId       = "AKSAADAppClientId"
KeyVault_SSHPublicKey       = "SSHPublicKey"
AKSClus                     = "AKSLabClusterwithRBAC"
AKSNodeCount                = "3"
#AKSWorkspaceName            = "AKSWorkspacehtdei"


EnvironmentTag      = "AKSLab"
EnvironmentUsageTag = "PoC"
OwnerTag            = "DF"
ProvisioningDateTag = "20190321"