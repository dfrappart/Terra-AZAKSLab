######################################################################
# VNet Creation 1 hub and 2 spokes
######################################################################

# Creating the VNet

module "VNetHub" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"

  #Module variable
  vNetName            = "${var.VNet1Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetLocation        = "${var.AzureRegion}"
  vNetAddressSpace    = "${var.VNet1IPRange}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

module "VNetSpoke1" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"

  #Module variable
  vNetName            = "${var.VNet2Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetLocation        = "${var.AzureRegion}"
  vNetAddressSpace    = "${var.VNet2IPRange}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

module "VNetSpoke2" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"

  #Module variable
  vNetName            = "${var.VNet3Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetLocation        = "${var.AzureRegion}"
  vNetAddressSpace    = "${var.VNet3IPRange}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

