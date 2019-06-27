#################################################################
#This file allows the creation of a storage account for Share
#################################################################

#####################################################################
# Storage Creation
######################################################################

#Creating File storage account

module "FileStorageAccount" {

    #Module location
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"
    source = "./Modules/03 StorageAccountGP"

    #Module variable
    StorageAccountName          = "${terraform.workspace == "Prod" ? "stoa${var.EnvironmentTag}file" : "stoa${var.EnvironmentTag}filedev"}"
    RGName                      = "${module.ResourceGroupHubSpoke.Name}"
    StorageAccountLocation      = "${var.AzureRegion}"
    StorageAccountTier          = "${lookup(var.storageaccounttier, 0)}"
    StorageReplicationType      = "${lookup(var.storagereplicationtype, 0)}"
    EnvironmentTag              = "${var.EnvironmentTag}"
    EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
    OwnerTag                    = "${var.OwnerTag}"
    ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

module "FileShare" {
    #Module Location
    source = "./Modules/05 StorageAccountShare"

    #Module Variables
    ShareName               = "${terraform.workspace == "Prod" ? "shareprod" : "sharedev"}"
    RGName                  = "${module.ResourceGroupHubSpoke.Name}"
    StorageAccountName      = "${module.FileStorageAccount.Name}"
    
}