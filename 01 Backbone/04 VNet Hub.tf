######################################################################
# VNet Creation 1 hub
######################################################################

# Creating the ResourceGroup

module "ResourceGroupHub" {
  #Module Location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//01 ResourceGroup/"
  source = "./Modules/01 ResourceGroup"

  #Module variable
  RGName              = "${var.RGHubName}${var.EnvironmentTag}"
  RGLocation          = var.AzureRegion
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag

}

# Creating the VNet

module "VNetHub" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"
  source = "./Modules/08 VNet"

  #Module variable
  VNetName            = var.VNetHubName
  RGName              = module.ResourceGroupHub.Name
  VNetLocation        = var.AzureRegion
  VNetAddressSpace    = var.VNetHubIPRange
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}


# Bastion_Subnet NSG

module "NSG_Bastion_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"
  source = "./Modules/09 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 1)}"
  RGName                      = module.ResourceGroupHub.Name
  NSGLocation                 = var.AzureRegion
  EnvironmentTag              = var.EnvironmentTag
  EnvironmentUsageTag         = var.EnvironmentUsageTag
  OwnerTag                    = var.OwnerTag
  ProvisioningDateTag         = var.ProvisioningDateTag
}

# Bastion_Subnet

module "Bastion_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"
  source = "./Modules/10-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 1)}_${module.VNetHub.Name}"
  RGName              = module.ResourceGroupHub.Name
  VNetName            = module.VNetHub.Name
  Subnetaddressprefix = lookup(var.SubnetAddressRange, 1)
  NSGId               = module.NSG_Bastion_Subnet.Id

}


# ShareSVC_Subnet NSG

module "NSG_ShareSVC_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"
  source = "./Modules/09 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 0)}_${module.VNetHub.Name}"
  RGName                      = module.ResourceGroupHub.Name
  NSGLocation                 = var.AzureRegion
  EnvironmentTag              = var.EnvironmentTag
  EnvironmentUsageTag         = var.EnvironmentUsageTag
  OwnerTag                    = var.OwnerTag
  ProvisioningDateTag         = var.ProvisioningDateTag
}

# ShareSVC_Subnet

module "ShareSVC_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"
  source = "./Modules/10-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 0)}_${module.VNetHub.Name}"
  RGName              = module.ResourceGroupHub.Name
  VNetName            = module.VNetHub.Name
  Subnetaddressprefix = lookup(var.SubnetAddressRange, 0)
  NSGId               = module.NSG_ShareSVC_Subnet.Id

}


# Hub Firewall Subnet

module "FW_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = lookup(var.SubnetName, 2)
  RGName              = module.ResourceGroupHub.Name
  VNetName            = module.VNetHub.Name
  Subnetaddressprefix = lookup(var.SubnetAddressRange, 2)

}


# Hub Gateway Subnet


module "GW_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = lookup(var.SubnetName, 3)
  RGName              = module.ResourceGroupHub.Name
  VNetName            = module.VNetHub.Name
  Subnetaddressprefix = lookup(var.SubnetAddressRange, 3)


}


# Hub Managed Bastion Subnet


module "ManagedBastion_Subnet" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"
  source = "./Modules/10-2 SubnetWithoutNSG"
  
  #Module variable
  SubnetName          = lookup(var.SubnetName, 4)
  RGName              = module.ResourceGroupHub.Name
  VNetName            = module.VNetHub.Name
  Subnetaddressprefix = lookup(var.SubnetAddressRange, 4)


}



/*
module "VNetSpoke1" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"
  source = "./Modules/02 VNet"

  #Module variable
  VNetName            = var.VNet2Name
  RGName              = module.ResourceGroupHubSpoke.Name
  vNetLocation        = var.AzureRegion
  vNetAddressSpace    = var.VNet2IPRange
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}

module "VNetSpoke2" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"
  source = "./Modules/02 VNet"

  #Module variable
  VNetName            = var.VNet3Name
  RGName              = module.ResourceGroupHubSpoke.Name
  vNetLocation        = var.AzureRegion
  vNetAddressSpace    = var.VNet3IPRange
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}

module "VNetSpoke3" {
  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02 VNet"
  source = "./Modules/02 VNet"
  
  #Module variable
  VNetName            = var.VNet4Name
  RGName              = module.ResourceGroupHubSpoke.Name
  vNetLocation        = var.AzureRegion
  vNetAddressSpace    = var.VNet4IPRange
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}

*/