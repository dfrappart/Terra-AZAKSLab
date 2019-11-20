##############################################################
#Output 
##############################################################


#Output for the module ACR

output "Name" {
  value = module.ACR.Name
  description = "The name of the ACR"
}


output "RGName" {
  value = module.ACR.RGName
  description = "The name of the RG containing the ACR"
}


output "Location" {
  value = module.ACR.Location
  description = "The location of the ACR"
}

output "AdminEnabled" {
  value = module.ACR.AdminEnabled
  description = "The status of the admin account state, enabled or not"
}


output "SKu" {
  value = module.ACR.SKu
  description = "The ACR SKU"
}

output "ReplicatedLocations" {
  value = module.ACR.ReplicatedLocations
  description = "The Region in which the ACR is replicated"
}


output "Id" {
  value = module.ACR.Id
  description = "The Container Registry ID"
}


output "ACRLoginServer" {
  value = module.ACR.ACRLoginServer
  description = "The URL that can be used to log into the container registry"
}



output "ACRAdminName" {
  value = module.ACR.ACRAdminName
  description = "The Region in which the ACR is replicated"
}



output "ACRAdminPassword" {
  value = module.ACR.ACRAdminPassword
  description = "The Admin password of the ACR"
  sensitive = true
}