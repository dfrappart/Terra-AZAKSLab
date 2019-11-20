######################################################
# This file defines which value are sent to output
######################################################

#Output for the RG module

output "RGSpokeName" {

  value = module.ResourceGroupSpoke.Name
}

output "RGSpokeLocation" {

  value = module.ResourceGroupSpoke.Location
}

output "RGSpokeId" {

  value = module.ResourceGroupSpoke.Id
  sensitive = true
}

#Output for the VNet module

output "VNetSpokeName" {
  value = module.VNetSpoke1.Name
}

output "VNetSpokeId" {
  value = module.VNetSpoke1.Id
  sensitive = true
}

output "VNetSpokeAddressSpace" {
  value = module.VNetSpoke1.AddressSpace
}

output "VNetSpokeRGName" {
  value = module.VNetSpoke1.RGName
}

output "VNetSpokeRGLocation" {
  value = module.VNetSpoke1.RGLocation
}

# Output for Subnets

#Subnet Pool 1

output "AKS_SubnetNodePool1_Spoke1_Name" {

  value = module.AKS_SubnetNodePool1_Spoke1.Name
}

output "AKS_SubnetNodePool1_Spoke1_Id" {

  value = module.AKS_SubnetNodePool1_Spoke1.Id
  sensitive = true
}

output "AKS_SubnetNodePool1_Spoke1_AddressPrefix" {

  value = module.AKS_SubnetNodePool1_Spoke1.AddressPrefix
}


# Subnet pool 2

output "AKS_SubnetNodePool2_Spoke1_Name" {

  value = module.AKS_SubnetNodePool2_Spoke1.Name
}

output "AKS_SubnetNodePool2_Spoke1_Id" {

  value = module.AKS_SubnetNodePool2_Spoke1.Id
  sensitive = true
}

output "AKS_SubnetNodePool2_Spoke1_AddressPrefix" {

  value = module.AKS_SubnetNodePool2_Spoke1.AddressPrefix
}

# Subnet Virtual Node

output "AKSVirtualNodes_Subnet_Spoke1_Name" {

  value = module.AKSVirtualNodes_Subnet_Spoke1.Name
}

output "AKSVirtualNodes_Subnet_Spoke1_Id" {

  value = module.AKSVirtualNodes_Subnet_Spoke1.Id
  sensitive = true
}

output "AKSVirtualNodes_Subnet_Spoke1_AddressPrefix" {

  value = module.AKSVirtualNodes_Subnet_Spoke1.AddressPrefix
}