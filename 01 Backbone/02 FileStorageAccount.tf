#################################################################
#This file allows the creation of a storage account for Share
#################################################################

#####################################################################
# Storage Creation
######################################################################

#Creating RG File storage account

module "ResourceGroupFiles" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGFilesName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}
#Creating File storage account

module "StoaFileRandomprefix" {
  #Module source
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"
  source = "./Modules/00 RandomString"

  #Module variables
  stringlenght        = "3"
  stringspecial       = "false"
  stringupper         = "false"

    
}

module "FileStorageAccount" {

    #Module location
    #source = "github.com/dfrappart/Terra-AZModuletest//Modules//03 StorageAccountGP"
    source = "./Modules/02 StorageAccountGP"

    #Module variable
    StorageAccountName          = "stoa${var.EnvironmentTag}${module.StoaFileRandomprefix.Result}file}"
    RGName                      = module.ResourceGroupFiles.Name
    StorageAccountLocation      = var.AzureRegion
    StorageAccountTier          = lookup(var.storageaccounttier, 0)
    StorageReplicationType      = lookup(var.storagereplicationtype, 0)
    EnvironmentTag              = var.EnvironmentTag
    EnvironmentUsageTag         = var.EnvironmentUsageTag
    OwnerTag                    = var.OwnerTag
    ProvisioningDateTag         = var.ProvisioningDateTag
}

module "FileShare" {
    #Module Location
    source = "./Modules/03 StorageAccountShare"

    #Module Variables
    ShareName               = "sharelab"
    StorageAccountName      = module.FileStorageAccount.Name
    
}