######################################################################
# VNet peering
######################################################################

module "Peering_VNetHub_To_Spoke1" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke1"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetHub.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetSpoke1.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_VNetHub_To_Spoke2" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke2"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetHub.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetSpoke2.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}


module "Peering_VNetHub_To_Spoke3" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke3"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetHub.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetSpoke3.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}
module "Peering_Spoke1_To_VNetHub" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke1_To_VNetHub"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetSpoke1.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetHub.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_Spoke2_To_VNetHub" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke2_To_VNetHub"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetSpoke2.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetHub.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_Spoke3_To_VNetHub" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke3_To_VNetHub"
  RGName                            = "${data.azurerm_resource_group.InfraRG.name}"
  LocalVNetName                     = "${data.azurerm_virtual_network.VNetSpoke3.name}"
  RemoteVNetId                      = "${data.azurerm_virtual_network.VNetHub.id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}