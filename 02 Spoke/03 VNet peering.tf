######################################################################
# VNet peering
######################################################################

module "Peering_VNetHub_To_Spoke1" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/08-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke1"
  RGName                            = data.azurerm_resource_group.RGHub.name
  LocalVNetName                     = data.terraform_remote_state.HubState.outputs.VNetHub_Name
  RemoteVNetId                      = module.VNetSpoke1.Id
  IsVirtualNetworkAcccessAllowed    = true
  IsForwardedTrafficAllowed         = true

}



module "Peering_Spoke1_To_VNetHub" {
#Module location
  #source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"
  source = "./Modules/08-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke1_To_VNetHub"
  RGName                            = module.ResourceGroupSpoke.Name
  LocalVNetName                     = module.VNetSpoke1.Name
  RemoteVNetId                      = data.terraform_remote_state.HubState.outputs.VNetHub_Id
  IsVirtualNetworkAcccessAllowed    = true
  IsForwardedTrafficAllowed         = true

}

