##############################################################
#This module allows the creation of a Network Security 
#Group Rule with source service tags and dest ASG
##############################################################



# creation of the rule

resource "azurerm_network_security_rule" "Terra-NSGRulewDestASG" {
  name                                       = var.NSGRuleName
  priority                                   = var.NSGRulePriority
  direction                                  = var.NSGRuleDirection
  access                                     = var.NSGRuleAccess
  protocol                                   = var.NSGRuleProtocol
  source_port_range                          = var.NSGRuleSourcePortRange
  destination_port_range                     = var.NSGRuleDestinationPortRange
  source_application_security_group_ids      = var.NSGRuleSourceASG
  destination_address_prefix                 = var.NSGRuleDestinationAddressPrefix
  resource_group_name                        = var.RGName
  network_security_group_name                = var.NSGReference
}

