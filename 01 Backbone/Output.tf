######################################################
# This file defines which value are sent to output
######################################################

######################################################
# Resource group Hub  Output

output "ResourceGroupHub_Name" {
  value = module.ResourceGroupHub.Name
}

output "ResourceGroup1_Id" {
  value = module.ResourceGroupHub.Id
  sensitive = true
}

######################################################
# Resource group Logs  Output

output "ResourceGroupLogs_Name" {
  value = module.ResourceGroupLogs.Name
}

output "ResourceGroupLogs_Id" {
  value = module.ResourceGroupLogs.Id
  sensitive = true
}

######################################################
# Resource group Files  Output

output "ResourceGroupFiles_Name" {
  value = module.ResourceGroupFiles.Name
}

output "ResourceGroupFiles_Id" {
  value = module.ResourceGroupFiles.Id
  sensitive = true
}

######################################################
# Diag & Log Storage account Info

output "DiagStorageAccountName" {
  value = module.DiagStorageAccount.Name
}

output "DiagStorageAccountID" {
  value = module.DiagStorageAccount.Id
  sensitive = true
}

output "DiagStorageAccountPrimaryBlobEP" {
  value = module.DiagStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "DiagStorageAccountPrimaryQueueEP" {
  value = module.DiagStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "DiagStorageAccountPrimaryTableEP" {
  value = module.DiagStorageAccount.PrimaryTableEP
  sensitive = true
}

output "DiagStorageAccountPrimaryFileEP" {
  value = module.DiagStorageAccount.PrimaryFileEP
  sensitive = true
}

output "DiagStorageAccountPrimaryAccessKey" {
  value = module.DiagStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "DiagStorageAccountSecondaryAccessKey" {
  value = module.DiagStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Files Storage account Info

output "FileStorageAccountName" {
  value = module.FileStorageAccount.Name
}

output "FileStorageAccountID" {
  value = module.FileStorageAccount.Id
  sensitive = true
}

output "FileStorageAccountPrimaryBlobEP" {
  value = module.FileStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "FileStorageAccountPrimaryQueueEP" {
  value = module.FileStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "FileStorageAccountPrimaryTableEP" {
  value = module.FileStorageAccount.PrimaryTableEP
  sensitive = true
}

output "FileStorageAccountPrimaryFileEP" {
  value = module.FileStorageAccount.PrimaryFileEP
  sensitive = true
}

output "FileStorageAccountPrimaryAccessKey" {
  value = module.FileStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "FileStorageAccountSecondaryAccessKey" {
  value = module.FileStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Resource group Key Vault  Output

output "ResourceGroupKeyVault_Name" {
  value = module.ResourceGroupKeyVault.Name
}

output "ResourceGroupKeyVault_Id" {
  value = module.ResourceGroupKeyVault.Id
  sensitive = true
}



######################################################
# VNet Hub info Output

output "VNetHub_Name" {
  value = module.VNetHub.Name
}

output "VNetHub_Id" {
  value = module.VNetHub.Id
  sensitive = true
}

output "VNetHub_AddressSpace" {
  value = module.VNetHub.AddressSpace
  sensitive = true
}

######################################################
# Subnet Bastion info Output

output "Bastion_Subnet_Name" {
  value = module.Bastion_Subnet.Name
}

output "Bastion_Subnet_Id" {
  value = module.Bastion_Subnet.Id
  sensitive = true
}

output "Bastion_Subnet_AddressPrefix" {
  value = module.Bastion_Subnet.AddressPrefix
  sensitive = true
}

output "Bastion_Subnet_NSG_Name" {
  value = module.NSG_Bastion_Subnet.Name
}

output "Bastion_Subnet_NSG_Id" {
  value = module.NSG_Bastion_Subnet.Id
  sensitive = true
}


######################################################
# Subnet Share SVC info Output

output "ShareSVC_Subnet_Name" {
  value = module.ShareSVC_Subnet.Name
}

output "ShareSVC_Subnet_Id" {
  value = module.ShareSVC_Subnet.Id
  sensitive = true
}

output "ShareSVC_Subnet_AddressPrefix" {
  value = module.ShareSVC_Subnet.AddressPrefix
  sensitive = true
}

output "ShareSVC_Subnett_NSG_Name" {
  value = module.NSG_ShareSVC_Subnet.Name
}

output "ShareSVC_Subnett_NSG_Id" {
  value = module.NSG_ShareSVC_Subnet.Id
  sensitive = true
}


######################################################
# Subnet Managed Bastion info Output

output "ManagedBastion_Subnet_Name" {
  value = module.ManagedBastion_Subnet.Name
}

output "ManagedBastion_Subnett_Id" {
  value = module.ManagedBastion_Subnet.Id
  sensitive = true
}

output "ManagedBastion_Subnet_AddressPrefix" {
  value = module.ManagedBastion_Subnet.AddressPrefix
  sensitive = true
}

######################################################
# Subnet Gateway info Output

output "GW_Subnet_Name" {
  value = module.GW_Subnet.Name
}

output "GW_Subnet_Id" {
  value = module.GW_Subnet.Id
  sensitive = true
}

output "GW_Subnet_AddressPrefix" {
  value = module.GW_Subnet.AddressPrefix
  sensitive = true
}

######################################################
# Subnet Gateway info Output

output "FW_Subnett_Name" {
  value = module.FW_Subnet.Name
}

output "FW_Subnet_Id" {
  value = module.FW_Subnet.Id
  sensitive = true
}

output "FW_Subnet_AddressPrefix" {
  value = module.FW_Subnet.AddressPrefix
  sensitive = true
}


/*
######################################################
# vNet Spoke1 info Output

output "VNet2_Name" {
  value = module.VNetSpoke1.Name
}

output "VNet2_Id" {
  value = module.VNetSpoke1.Id
  sensitive = true
}

output "VNet2_AddressSpace" {
  value = module.VNetSpoke1.AddressSpace
  sensitive = true
}

######################################################
# vNet Spoke2 info Output

output "VNet3_Name" {
  value = module.VNetSpoke2.Name
}

output "VNet3_Id" {
  value = module.VNetSpoke2.Id
  sensitive = true
}

output "VNet3_AddressSpace" {
  value = module.VNetSpoke2.AddressSpace
  sensitive = true
}

######################################################
# vNet Spoke3 info Output

output "VNet4_Name" {
  value = module.VNetSpoke3.Name
}

output "VNet4_Id" {
  value = module.VNetSpoke3.Id
  sensitive = true
}

output "VNet4_AddressSpace" {
  value = module.VNetSpoke3.AddressSpace
  sensitive = true
}

######################################################
# Diag & Log Storage account Info

output "DiagStorageAccountName" {
  value = module.DiagStorageAccount.Name
}

output "DiagStorageAccountID" {
  value = module.DiagStorageAccount.Id
  sensitive = true
}

output "DiagStorageAccountPrimaryBlobEP" {
  value = module.DiagStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "DiagStorageAccountPrimaryQueueEP" {
  value = module.DiagStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "DiagStorageAccountPrimaryTableEP" {
  value = module.DiagStorageAccount.PrimaryTableEP
  sensitive = true
}

output "DiagStorageAccountPrimaryFileEP" {
  value = module.DiagStorageAccount.PrimaryFileEP
  sensitive = true
}

output "DiagStorageAccountPrimaryAccessKey" {
  value = module.DiagStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "DiagStorageAccountSecondaryAccessKey" {
  value = module.DiagStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Files Storage account Info

output "FileStorageAccountName" {
  value = module.FileStorageAccount.Name
}

output "FileStorageAccountID" {
  value = module.FileStorageAccount.Id
  sensitive = true
}

output "FileStorageAccountPrimaryBlobEP" {
  value = module.FileStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "FileStorageAccountPrimaryQueueEP" {
  value = module.FileStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "FileStorageAccountPrimaryTableEP" {
  value = module.FileStorageAccount.PrimaryTableEP
  sensitive = true
}

output "FileStorageAccountPrimaryFileEP" {
  value = module.FileStorageAccount.PrimaryFileEP
  sensitive = true
}

output "FileStorageAccountPrimaryAccessKey" {
  value = module.FileStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "FileStorageAccountSecondaryAccessKey" {
  value = module.FileStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Subnet info Output
######################################################

######################################################
#Bastion_Subnet

output "VNet1_Subnet1_Name" {
  value = module.Bastion_Subnet.Name
}

output "VNet1_Subnet1_Id" {
  value = module.Bastion_Subnet.Id
  sensitive = true
}

output "VNet1_Subnet1_AddressPrefix" {
  value = module.Bastion_Subnet.AddressPrefix
  sensitive = true
}

######################################################
#ShareSVC_Subnet

output "VNet1_Subnet2_Name" {
  value = module.ShareSVC_Subnet.Name
}

output "VNet1_Subnet2_Id" {
  value = module.ShareSVC_Subnet.Id
  sensitive = true
}

output "VNet1_Subnet2_AddressPrefix" {
  value = module.ShareSVC_Subnet.AddressPrefix
  sensitive = true
}
######################################################
#AZFW_Subnet

output "VNet1_Subnet3_Name" {
  value = module.FW_Subnet.Name
}

output "VNet1_Subnet3_Id" {
  value = module.FW_Subnet.Id
  sensitive = true
}

output "VNet1_Subnet3_AddressPrefix" {
  value = module.FW_Subnet.AddressPrefix
  sensitive = true
}


######################################################
#AZGW_Subnet

output "VNet1_Subnet4_Name" {
  value = module.GW_Subnet.Name
}

output "VNet1_Subnet4_Id" {
  value = module.GW_Subnet.Id
  sensitive = true
}

output "VNet1_Subnet4_AddressPrefix" {
  value = module.GW_Subnet.AddressPrefix
  sensitive = true
}

######################################################
#Managed Bastion Subnet

output "VNet1_Subnet5_Name" {
  value = module.ManagedBastion_Subnet.Name
}

output "VNet1_Subnet5_Id" {
  value = module.ManagedBastion_Subnet.Id
  sensitive = true
}

output "VNet1_Subnet5_AddressPrefix" {
  value = module.ManagedBastion_Subnet.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 1 AKS Subnet

output "VNet2_Subnet1_Name" {
  value = module.AKS_Subnet_Spoke1.Name
}

output "VNet2_Subnet1_Id" {
  value = module.AKS_Subnet_Spoke1.Id
  sensitive = true
}

output "VNet2_Subnet1_AddressPrefix" {
  value = module.AKS_Subnet_Spoke1.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 1 Virtual Nodes Subnet

output "VNet2_Subnet2_Name" {
  value = module.AKSVirtualNodes_Subnet_Spoke1.Name
}

output "VNet2_Subnet2_Id" {
  value = module.AKSVirtualNodes_Subnet_Spoke1.Id
  sensitive = true
}

output "VNet2_Subnet2_AddressPrefix" {
  value = module.AKSVirtualNodes_Subnet_Spoke1.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 2 AKS Subnet

output "VNet3_Subnet1_Name" {
  value = module.AKS_Subnet_Spoke2.Name
}

output "VNet3_Subnet1_Id" {
  value = module.AKS_Subnet_Spoke2.Id
  sensitive = true
}

output "VNet3_Subnet1_AddressPrefix" {
  value = module.AKS_Subnet_Spoke2.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 2 Virtual Nodes Subnet

output "VNet3_Subnet2_Name" {
  value = module.AKSVirtualNodes_Subnet_Spoke2.Name
}

output "VNet3_Subnet2_Id" {
  value = module.AKSVirtualNodes_Subnet_Spoke2.Id
  sensitive = true
}

output "VNet3_Subnet2_AddressPrefix" {
  value = module.AKSVirtualNodes_Subnet_Spoke2.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 3 FE_Subnet

output "VNet4_Subnet1_Name" {
  value = module.FE_Subnet_Spoke3.Name
}

output "VNet4_Subnet1_Id" {
  value = module.FE_Subnet_Spoke3.Id
  sensitive = true
}

output "VNet4_Subnet1_AddressPrefix" {
  value = module.FE_Subnet_Spoke3.AddressPrefix
  sensitive = true
}


######################################################
#Spoke 3 BE_Subnet

output "VNet4_Subnet2_Name" {
  value = module.BE_Subnet_Spoke3.Name
}

output "VNet4_Subnet2_Id" {
  value = module.BE_Subnet_Spoke3.Id
  sensitive = true
}

output "VNet4_Subnet2_AddressPrefix" {
  value = module.BE_Subnet_Spoke3.AddressPrefix
  sensitive = true
}

######################################################
#Spoke 3 Application Gateway Subnet

output "VNet4_Subnet3_Name" {
  value = module.AppGW_Subnet.Name
}

output "VNet4_Subnet3_Id" {
  value = module.AppGW_Subnet.Id
  sensitive = true
}

output "VNet4_Subnet3_AddressPrefix" {
  value = module.AppGW_Subnet.AddressPrefix
  sensitive = true
}

######################################################
#Created Azure Keyvault

output "KeyVault_Id" {
  value = module.KeyVault.Id
  sensitive = true
}

output "KeyVault_Name" {
  value = module.KeyVault.Name
}

output "KeyVault_Uri" {
  value = module.KeyVault.URI
  sensitive = true
}

output "KeyVault_Sku" {
  value = module.KeyVault.SKU
  sensitive = true
}


output "KeyVault_enabled_for_disk_encryption" {
  value = module.KeyVault.KeyVault_enabled_for_disk_encryption
}

output "KeyVault_enabled_for_template_deployment" {
  value = module.KeyVault.KeyVault_enabled_for_template_deployment
}


######################################################
#workspace analytics output

output "LAWorkspace_Name" {
  value = module.SharedLAWS.Name

}


output "LAWorkspace_Location" {
  value = module.SharedLAWS.Location

}

output "LAWorkspace_RG" {
  value = module.SharedLAWS.RG

}

output "LAWorkspace_Sku" {
  value = module.SharedLAWS.Sku

}

output "LAWorkspace_Id" {
  value = module.SharedLAWS.Id
  sensitive = true

}

output "LAWorkspace_PSK" {
  sensitive = true
  value = module.SharedLAWS.PSK

}

output "LAWorkspace_SSK" {
  sensitive = true
  value = module.SharedLAWS.SSK

}

output "LAWorkspace_WSId" {

  value = module.SharedLAWS.WSId
  sensitive = true

}

output "LAWorkspace_PortalUrl" {

  value = module.SharedLAWS.PortalUrl

}

*/


