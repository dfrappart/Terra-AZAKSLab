######################################################################
# This file deploy an Azure Container Registry
######################################################################
/*
#Creating storage account for ACR

module "ACRStorageAccount" {

    #Module location
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"

    #Module variable
    StorageAccountName          = "stoa${var.EnvironmentTag}acr"
    RGName                      = "${module.ResourceGroupHubSpoke.Name}"
    StorageAccountLocation      = "${var.AzureRegion}"
    StorageAccountTier          = "${lookup(var.storageaccounttier, 0)}"
    StorageReplicationType      = "${lookup(var.storagereplicationtype, 0)}"
    EnvironmentTag              = "${var.EnvironmentTag}"
    EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
    OwnerTag                    = "${var.OwnerTag}"
    ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}
*/

#Random prefix for the ACR
/*
module "AKSWSRandomPrefix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "4"
    stringspecial       = "false"
    stringupper         = "false"
    
}

#ACR Creation

module "AKSLabACR" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//49 Azure Container Registry/"

    #Module variables
    ACRName                     = "${module.AKSWSRandomPrefix.Result}${var.EnvironmentTag}acr"
    ACRRG                       = "${module.ResourceGroupHubSpoke.Name}"
    ACRLocation                 = "${var.AzureRegion}"    
    IsAdminEnabled              = "${var.ACRAdminAccountEnabled}"
    #ACRSTOAID                   = "${module.ACRStorageAccount.Id}"
    ACRSku                      = "${var.ACRSku}"
    ACRReplList                 = "${var.ACRReplicationList}"
    EnvironmentTag              = "${var.EnvironmentTag}"
    EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
    OwnerTag                    = "${var.OwnerTag}"
    ProvisioningDateTag         = "${var.ProvisioningDateTag}"


} 

*/