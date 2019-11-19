

module "ResourceGroupACR" {
  #Module Location
  source = "./Modules/01 ResourceGroup/"

  #Module variable
  RGName              = "RG${var.EnvironmentTag}${var.RGName}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}


module "ACRRandomPrefix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "4"
    stringspecial       = "false"
    stringupper         = "false"
    
}

module "ACR" {
    #Module source
    source = "./Modules/49 Azure Container Registry/"

    #Module variables
    ACRName                     = "${module.ACRRandomPrefix.Result}${var.OwnerTag}${var.EnvironmentTag}acr"
    ACRRG                       = module.ResourceGroupACR.Name
    ACRLocation                 = var.AzureRegion    
    IsAdminEnabled              = var.ACRAdminAccountEnabled
    ACRSku                      = var.ACRSku
    #ACRReplList                 = var.ACRReplicationList
    EnvironmentTag              = var.EnvironmentTag
    EnvironmentUsageTag         = var.EnvironmentUsageTag
    OwnerTag                    = var.OwnerTag
    ProvisioningDateTag         = var.ProvisioningDateTag


}