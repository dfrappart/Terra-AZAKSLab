#######################################################
# This file deploys the Azure Firewall for the Hub VNet
#It also deploys the UDR to route traffic to AZ FW
#And a few rules for examples
#######################################################

#UDR for AZ FW
/*
module "RouteTable_Spoke2" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//17 RouteTable"

  #Module variable
  RouteTableName      = "RouteTabletoAzFW"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  RTLocation          = "${var.AzureRegion}"
  BGPDisabled         = "false"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

module "Route_Spoke2" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//16 Route"

  #Module variable
  RouteName          = "RoutetoAzFW_Spoke2_BE_Subnet"
  RGName             = "${module.ResourceGroupHubSpoke.Name}"
  RTName             = "${module.RouteTable_Spoke2.Name}"
  DestinationCIDR    = "0.0.0.0/0"
  NextHop            = "VirtualAppliance"
  NextHopinIPAddress = "${cidrhost(var.SubnetAddressRange[2],4)}"
}

#FW PIP

module "FW_PIP" {
  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//10 PublicIP"

  #Module variables
  PublicIPName        = "azurefwvnet2pip"
  PublicIPLocation    = "${var.AzureRegion}"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  IsZoneRedundant     = "true"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

#FW Creation

module "FW_Hub" {

  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//23 AzureRMFW"

  #Module variables
  FWName              = "AZFWPHub"
  RGName              = "${module.ResourceGroupHubSpoke.Name}"
  FWLocation          = "${var.AzureRegion}"
  FWSubnetId          = "${module.FW_Subnet.Id}"
  FWPIPId             = "${element(module.FW_PIP.ZRIPIds,0)}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
}

#FW Network Rule collection 

module "FW_Network_CollectionRules_1" {

  #Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//24 AzureRM FW Collection Rules"

  #Module variables
  FWRuleCollecName              = "FW_Network_CollectionRules_1"
  RGName                        = "${module.ResourceGroupHubSpoke.Name}"
  FWName                        = "${module.FW_Hub.Name}"
  FWRuleCollecAction            = "Allow"
  FWRuleName                    = "StdEgressAllowed"
  FWRuleDesc                    = "Terraform created rule"
  FWRuleCollecSourceAddresses   = ["${module.BE_Subnet.AddressPrefix}"]
  FWRuleCollecDestPorts         = ["80","443","53"]
  FWRuleCollecDestAddresses     = ["0.0.0.0/0"]


}

*/