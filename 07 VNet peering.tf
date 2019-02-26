######################################################################
# VNet peering
######################################################################

module "Peering_VNetHub_To_Spoke1" {
#Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke1"
  RGName                            = "${module.ResourceGroupHubSpoke.Name}"
  LocalVNetName                     = "${module.VNetHub.Name}"
  RemoteVNetId                      = "${module.VNetSpoke1.Id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_VNetHub_To_Spoke2" {
#Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_VNetHub_To_Spoke2"
  RGName                            = "${module.ResourceGroupHubSpoke.Name}"
  LocalVNetName                     = "${module.VNetHub.Name}"
  RemoteVNetId                      = "${module.VNetSpoke2.Id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_Spoke1_To_VNetHub" {
#Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke1_To_VNetHub"
  RGName                            = "${module.ResourceGroupHubSpoke.Name}"
  LocalVNetName                     = "${module.VNetSpoke1.Name}"
  RemoteVNetId                      = "${module.VNetHub.Id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}

module "Peering_Spoke2_To_VNetHub" {
#Module location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//02-2 Network Peering"

  #Module variable
  VNetPeeringName                   = "Peering_Spoke2_To_VNetHub"
  RGName                            = "${module.ResourceGroupHubSpoke.Name}"
  LocalVNetName                     = "${module.VNetSpoke2.Name}"
  RemoteVNetId                      = "${module.VNetHub.Id}"
  IsVirtualNetworkAcccessAllowed    = "true"
  IsForwardedTrafficAllowed         = "true"

}