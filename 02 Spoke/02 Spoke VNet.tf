######################################################################
# VNet Creation 1 Spoke
######################################################################

# Creating the ResourceGroup

module "ResourceGroupSpoke" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGSpokeName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}

module "VNetSpoke1" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"
  source = "./Modules/08 VNet"

  #Module variable
  VNetName            = var.VNetSpokeName
  RGName              = module.ResourceGroupSpoke.Name
  VNetLocation        = var.AzureRegion
  VNetAddressSpace    = var.VNetSpokeIPRange
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}


module "AKS_SubnetNodePool1_Spoke1" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = element(var.SubnetName, 0)
  RGName              = module.ResourceGroupSpoke.Name
  VNetName            = module.VNetSpoke1.Name
  Subnetaddressprefix = element(var.SubnetAddressRange, 0)


}

module "AKS_SubnetNodePool2_Spoke1" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = element(var.SubnetName, 1)
  RGName              = module.ResourceGroupSpoke.Name
  VNetName            = module.VNetSpoke1.Name
  Subnetaddressprefix = element(var.SubnetAddressRange, 1)


}

module "AKSVirtualNodes_Subnet_Spoke1" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = element(var.SubnetName, 2)
  RGName              = module.ResourceGroupSpoke.Name
  VNetName            = module.VNetSpoke1.Name
  Subnetaddressprefix = element(var.SubnetAddressRange, 2)


}