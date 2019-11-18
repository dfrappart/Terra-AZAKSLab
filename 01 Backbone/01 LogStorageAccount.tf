#################################################################
#This file allows the creation of a storage account for diag logs
#################################################################

#####################################################################
# Storage Creation
######################################################################

#Creating RG Log storage account


module "ResourceGroupLogs" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGLogsName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}


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

#Creating Log storage account


module "DiagStorageAccount" {

    #Module location
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"
    source = "./Modules/02 StorageAccountGP"
    #Module variable
    StorageAccountName          = "stoa${var.EnvironmentTag}${module.StoaLogRandomprefix.Result}log}"
    RGName                      = module.ResourceGroupLogs.Name
    StorageAccountLocation      = var.AzureRegion
    StorageAccountTier          = lookup(var.storageaccounttier, 0)
    StorageReplicationType      = lookup(var.storagereplicationtype, 0)
    EnvironmentTag              = var.EnvironmentTag
    EnvironmentUsageTag         = var.EnvironmentUsageTag
    OwnerTag                    = var.OwnerTag
    ProvisioningDateTag         = var.ProvisioningDateTag
}