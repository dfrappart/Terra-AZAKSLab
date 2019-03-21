######################################################
# This file deploys the subnet and NSG for each VNets
######################################################

######################################################################
# Subnet and NSG
######################################################################

######################################################################
# Hub Bastion
######################################################################

#Bastion_Subnet NSG

module "NSG_Bastion_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 1)}"
  RGName                      = "${module.ResourceGroupHubSpoke.Name}"
  NSGLocation                 = "${var.AzureRegion}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  OwnerTag                    = "${var.OwnerTag}"
  ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

#Bastion_Subnet

module "Bastion_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 1)}_${module.VNetHub.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetHub.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 1)}"
  NSGid               = "${module.NSG_Bastion_Subnet.Id}"

}

/*
module "Bastion_NSG_Subnet_Assocation" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07-1 NSG Association"

  #Module variable
  SubnetId            = "${module.Bastion_Subnet.Id}"
  NSGId               = "${module.NSG_Bastion_Subnet.Id}"


}

*/

######################################################################
# Hub ShareSVC_Subnet
######################################################################

#ShareSVC_Subnet NSG

module "NSG_ShareSVC_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 0)}_${module.VNetHub.Name}"
  RGName                      = "${module.ResourceGroupHubSpoke.Name}"
  NSGLocation                 = "${var.AzureRegion}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  OwnerTag                    = "${var.OwnerTag}"
  ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

#ShareSVC_Subnet

module "ShareSVC_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 0)}_${module.VNetHub.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetHub.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 0)}"
  NSGid               = "${module.NSG_ShareSVC_Subnet.Id}"

}

/*

module "ShareSVC_NSG_Subnet_Assocation" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07-1 NSG Association"

  #Module variable
  SubnetId            = "${module.ShareSVC_Subnet.Id}"
  NSGId               = "${module.NSG_ShareSVC_Subnet.Id}"


}

*/

######################################################################
# Hub Firewall Subnet
######################################################################

module "FW_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 2)}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetHub.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 2)}"

}

######################################################################
# Hub Gateway Subnet
######################################################################

module "GW_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 3)}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetHub.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 3)}"


}

######################################################################
# Spoke 1 AKS Subnet
######################################################################

module "AKS_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 4)}_${module.VNetSpoke1.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetSpoke1.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 4)}"


}

module "AKSNoRbac_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-2 SubnetWithoutNSG"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 8)}_${module.VNetSpoke1.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetSpoke1.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 8)}"


}
######################################################################
# Spoke 2 FE Subnet
######################################################################

#FE_Subnet NSG

module "NSG_FE_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 6)}_${module.VNetSpoke2.Name}"
  RGName                      = "${module.ResourceGroupHubSpoke.Name}"
  NSGLocation                 = "${var.AzureRegion}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  OwnerTag                    = "${var.OwnerTag}"
  ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

#FE_Subnet

module "FE_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 6)}_${module.VNetSpoke2.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetSpoke2.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 6)}"
  NSGid               = "${module.NSG_FE_Subnet.Id}"

}

/*
module "FE_NSG_Subnet_Assocation" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07-1 NSG Association"

  #Module variable
  SubnetId            = "${module.NSG_FE_Subnet.Id}"
  NSGId               = "${module.FE_Subnet.Id}"


}

*/

######################################################################
# Spoke 2 BE Subnet
######################################################################

#BE_Subnet NSG

module "NSG_BE_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 7)}_${module.VNetSpoke2.Name}"
  RGName                      = "${module.ResourceGroupHubSpoke.Name}"
  NSGLocation                 = "${var.AzureRegion}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  OwnerTag                    = "${var.OwnerTag}"
  ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

#BE_Subnet


module "BE_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 7)}_${module.VNetSpoke2.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetSpoke2.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 7)}"
  NSGid               = "${module.NSG_BE_Subnet.Id}"

}

/*

module "BE_NSG_Subnet_Assocation" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07-1 NSG Association"

  #Module variable
  SubnetId            = "${module.NSG_BE_Subnet.Id}"
  NSGId               = "${module.BE_Subnet.Id}"


}

*/

######################################################################
# Spoke 2 Application Gateway Subnet
######################################################################

#AppGW_Subnet NSG

module "NSG_AppGW_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07 NSG"

  #Module variable
  NSGName                     = "NSG_${lookup(var.SubnetName, 5)}_${module.VNetSpoke2.Name}"
  RGName                      = "${module.ResourceGroupHubSpoke.Name}"
  NSGLocation                 = "${var.AzureRegion}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  EnvironmentTag              = "${var.EnvironmentTag}"
  EnvironmentUsageTag         = "${var.EnvironmentUsageTag}"
  OwnerTag                    = "${var.OwnerTag}"
  ProvisioningDateTag         = "${var.ProvisioningDateTag}"
}

#BE_Subnet

module "AppGW_Subnet" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//06-1 Subnet"

  #Module variable
  SubnetName          = "${lookup(var.SubnetName, 5)}_${module.VNetSpoke2.Name}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  vNetName            = "${module.VNetSpoke2.Name}"
  Subnetaddressprefix = "${lookup(var.SubnetAddressRange, 5)}"
  NSGid               = "${module.NSG_AppGW_Subnet.Id}"

}

/*
module "AppGW_NSG_Subnet_Assocation" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//07-1 NSG Association"

  #Module variable
  SubnetId            = "${module.NSG_AppGW_Subnet.Id}"
  NSGId               = "${module.AppGW_Subnet.Id}"


}

*/