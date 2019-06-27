######################################################
# This file defines which value are sent to output
######################################################

output "VNetHubToSpoke1Id" {
  value = "${module.Peering_VNetHub_To_Spoke1.PeeringId}"
}
output "VNetHubToSpoke1Name" {
  value = "${module.Peering_VNetHub_To_Spoke1.Name}"
}

output "VNetHubToSpoke1LocalVNetName" {
  value = "${module.Peering_VNetHub_To_Spoke1.LocalVNetName}"
}

output "VNetHubToSpoke1IsVirtualNetworkAcccessAllowed" {
  value = "${module.Peering_VNetHub_To_Spoke1.IsVirtualNetworkAcccessAllowed}"
}

output "VNetHubToSpoke1RemoteVNetId" {
  value = "${module.Peering_VNetHub_To_Spoke1.RemoteVNetId}"
}

output "VNetHubToSpoke1IsForwardedTrafficAllowed" {
  value = "${module.Peering_VNetHub_To_Spoke1.IsForwardedTrafficAllowed}"
}

output "VNetHubToSpoke1IIsGWTransitAllowed" {
  value = "${module.Peering_VNetHub_To_Spoke1.IsGWTransitAllowed}"
}

output "VNetHubToSpoke2Id" {
  value = "${module.Peering_VNetHub_To_Spoke2.PeeringId}"
}

output "VNetHubToSpoke3Id" {
  value = "${module.Peering_VNetHub_To_Spoke3.PeeringId}"
}

output "VNetSpoke1ToHubId" {
  value = "${module.Peering_Spoke1_To_VNetHub.PeeringId}"
}

output "VNetSpoke2ToHubId" {
  value = "${module.Peering_Spoke2_To_VNetHub.PeeringId}"
}

output "VNetSpoke3ToHubId" {
  value = "${module.Peering_Spoke3_To_VNetHub.PeeringId}"
}