#################################################################
#This file allows the creation of a storage account for Share
#################################################################

#####################################################################
# Storage Creation
######################################################################

#Creating Log storage account

module "FileStorageAccount" {

    #Module location
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"

    #Module variable
    StorageAccountName          = "${terraform.workspace == "default" ? "stoa${var.EnvironmentTag}file" : "stoa${var.EnvironmentTag}filedev"}"
    RGName                      = "${module.ResourceGroupHubSpoke.Name}"
    StorageAccountLocation      = "${var.AzureRegion}"
    StorageAccountTier          = "${lookup(var.storageaccounttier, 0)}"
    StorageReplicationType      = "${lookup(var.storagereplicationtype, 0)}"
    EnvironmentTag              = "${var.EnvironmentTag}"
    EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
    OwnerTag                    = "${var.OwnerTag}"
    ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}