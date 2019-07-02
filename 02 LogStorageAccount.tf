#################################################################
#This file allows the creation of a storage account for diag logs
#################################################################

#####################################################################
# Storage Creation
######################################################################

#Creating Log storage account

#Keyvault Random prefix
module "StoaLogRandomprefix" {
  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"
  source = "./Modules/00 RandomString"

  #Module variables
  stringlenght        = "3"
  stringspecial       = "false"
  stringupper         = "false"

    
}

module "DiagStorageAccount" {

    #Module location
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"
    source = "./Modules/03 StorageAccountGP"
    #Module variable
    StorageAccountName          = "${terraform.workspace == "Prod" ? "stoa${var.EnvironmentTag}${module.StoaLogRandomprefix.Result}log" : "stoa${var.EnvironmentTag}${module.StoaLogRandomprefix.Result}logdev"}"
    RGName                      = "${module.ResourceGroupHubSpoke.Name}"
    StorageAccountLocation      = "${var.AzureRegion}"
    StorageAccountTier          = "${lookup(var.storageaccounttier, 0)}"
    StorageReplicationType      = "${lookup(var.storagereplicationtype, 0)}"
    EnvironmentTag              = "${var.EnvironmentTag}"
    EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
    OwnerTag                    = "${var.OwnerTag}"
    ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}