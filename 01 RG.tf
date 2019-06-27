######################################################################
# Resource Group deployment
######################################################################

# Creating the ResourceGroups

module "ResourceGroupHubSpoke" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGName}${var.EnvironmentTag}"
  RGLocation          = "${var.AzureRegion}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"

}




/*
module "ResourceGroupBastion" {
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGBastionName}${var.EnvironmentTag}"
  RGLocation          = "${var.AzureRegion}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"

}

*/