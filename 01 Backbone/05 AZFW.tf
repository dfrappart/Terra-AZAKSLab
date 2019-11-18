#######################################################
# This file deploys the Azure Firewall for the Hub VNet
#######################################################



#FW Creation

module "FW_Hub" {

  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//23 AzureRMFW"
  source = "./Modules/11 AzureRMFW"

  #Module variables
  FWName              = var.AZFWHub
  RGName              = module.ResourceGroupHub.Name
  FWLocation          = var.AzureRegion
  FWSubnetId          = module.FW_Subnet.Id
  EnvironmentTag      = var.EnvironmentTag
  EnvironmentUsageTag = var.EnvironmentUsageTag
  OwnerTag            = var.OwnerTag
  ProvisioningDateTag = var.ProvisioningDateTag
}

#FW Network Rule collection 
/*
module "FW_Network_CollectionRules_1" {

  #Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//24 AzureRM FW Collection Rules"
  source = "./Modules/4 AzureRM FW Collection Rules"

  #Module variables
  FWRuleCollecName              = "FW_Network_CollectionRules_1"
  RGName                        = "${module.ResourceGroupHubSpoke.Name}"
  FWName                        = "${module.FW_Hub.Name}"
  FWRuleCollecAction            = "Allow"
  FWRuleName                    = "StdEgressAllowed"
  FWRuleDesc                    = "Terraform created rule"
  FWRuleCollecSourceAddresses   = ["${module.BE_Subnet_Spoke3.AddressPrefix}"]
  FWRuleCollecDestPorts         = ["80","443","53"]
  FWRuleCollecDestAddresses     = ["0.0.0.0/0"]


}
*/
