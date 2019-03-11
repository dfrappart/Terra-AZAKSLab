######################################################
# This file defines which value are sent to output
######################################################

######################################################
# Resource group Hub & Spoke info Output

output "ResourceGroup1_Name" {
  value = "${module.ResourceGroupHubSpoke.Name}"
}

output "ResourceGroup1_Id" {
  value = "${module.ResourceGroupHubSpoke.Id}"
}

######################################################
# Resource group Bastion info Output

output "ResourceGroup2_nName" {
  value = "${module.ResourceGroupBastion.Name}"
}

output "ResourceGroup2_Id" {
  value = "${module.ResourceGroupBastion.Id}"
}




######################################################
# vNet Hub info Output

output "VNet1_Name" {
  value = "${module.VNetHub.Name}"
}

output "VNet1_Id" {
  value = "${module.VNetHub.Id}"
}

output "VNet1_AddressSpace" {
  value = "${module.VNetHub.AddressSpace}"
}

######################################################
# vNet Spoke1 info Output

output "VNet2_Name" {
  value = "${module.VNetSpoke1.Name}"
}

output "VNet2_Id" {
  value = "${module.VNetSpoke1.Id}"
}

output "VNet2_AddressSpace" {
  value = "${module.VNetSpoke1.AddressSpace}"
}

######################################################
# vNet Spoke2 info Output

output "VNet3_Name" {
  value = "${module.VNetSpoke2.Name}"
}

output "VNet3_Id" {
  value = "${module.VNetSpoke2.Id}"
}

output "VNet3_AddressSpace" {
  value = "${module.VNetSpoke2.AddressSpace}"
}

######################################################
# Diag & Log Storage account Info

output "DiagStorageAccountName" {
  value = "${module.DiagStorageAccount.Name}"
}

output "DiagStorageAccountID" {
  value = "${module.DiagStorageAccount.Id}"
}

output "DiagStorageAccountPrimaryBlobEP" {
  value = "${module.DiagStorageAccount.PrimaryBlobEP}"
}

output "DiagStorageAccountPrimaryQueueEP" {
  value = "${module.DiagStorageAccount.PrimaryQueueEP}"
}

output "DiagStorageAccountPrimaryTableEP" {
  value = "${module.DiagStorageAccount.PrimaryTableEP}"
}

output "DiagStorageAccountPrimaryFileEP" {
  value = "${module.DiagStorageAccount.PrimaryFileEP}"
}

output "DiagStorageAccountPrimaryAccessKey" {
  value = "${module.DiagStorageAccount.PrimaryAccessKey}"
}

output "DiagStorageAccountSecondaryAccessKey" {
  value = "${module.DiagStorageAccount.SecondaryAccessKey}"
}

######################################################
# Files Storage account Info

output "FileStorageAccountName" {
  value = "${module.FileStorageAccount.Name}"
}

output "FileStorageAccountID" {
  value = "${module.FileStorageAccount.Id}"
}

output "FileStorageAccountPrimaryBlobEP" {
  value = "${module.FileStorageAccount.PrimaryBlobEP}"
}

output "FileStorageAccountPrimaryQueueEP" {
  value = "${module.FileStorageAccount.PrimaryQueueEP}"
}

output "FileStorageAccountPrimaryTableEP" {
  value = "${module.FileStorageAccount.PrimaryTableEP}"
}

output "FileStorageAccountPrimaryFileEP" {
  value = "${module.FileStorageAccount.PrimaryFileEP}"
}

output "FileStorageAccountPrimaryAccessKey" {
  value = "${module.FileStorageAccount.PrimaryAccessKey}"
}

output "FileStorageAccountSecondaryAccessKey" {
  value = "${module.FileStorageAccount.SecondaryAccessKey}"
}

######################################################
# Subnet info Output
######################################################

######################################################
#Bastion_Subnet

output "VNet1_Subnet1_Name" {
  value = "${module.Bastion_Subnet.Name}"
}

output "VNet1_Subnet1_Id" {
  value = "${module.Bastion_Subnet.Id}"
}

output "VNet1_Subnet1_AddressPrefix" {
  value = "${module.Bastion_Subnet.AddressPrefix}"
}

######################################################
#ShareSVC_Subnet

output "VNet1_Subnet2_Name" {
  value = "${module.ShareSVC_Subnet.Name}"
}

output "VNet1_Subnet2_Id" {
  value = "${module.ShareSVC_Subnet.Id}"
}

output "VNet1_Subnet2_AddressPrefix" {
  value = "${module.ShareSVC_Subnet.AddressPrefix}"
}
######################################################
#AZFW_Subnet
/*
output "VNet1_Subnet3_Name" {
  value = "${module.FW_Subnet.Name}"
}

output "VNet1_Subnet3_Id" {
  value = "${module.FW_Subnet.Id}"
}

output "VNet1_Subnet3_AddressPrefix" {
  value = "${module.FW_Subnet.AddressPrefix}"
}
*/

######################################################
#AZGW_Subnet

output "VNet1_Subnet4_Name" {
  value = "${module.GW_Subnet.Name}"
}

output "VNet1_Subnet4_Id" {
  value = "${module.GW_Subnet.Id}"
}

output "VNet1_Subnet4_AddressPrefix" {
  value = "${module.GW_Subnet.AddressPrefix}"
}

######################################################
#Spoke 1 AKS Subnet

output "VNet2_Subnet1_Name" {
  value = "${module.AKS_Subnet.Name}"
}

output "VNet2_Subnet1_Id" {
  value = "${module.AKS_Subnet.Id}"
}

output "VNet2_Subnet1_AddressPrefix" {
  value = "${module.AKS_Subnet.AddressPrefix}"
}

######################################################
#Spoke 2 FE_Subnet

output "VNet3_Subnet1_Name" {
  value = "${module.FE_Subnet.Name}"
}

output "VNet3_Subnet1_Id" {
  value = "${module.FE_Subnet.Id}"
}

output "VNet3_Subnet1_AddressPrefix" {
  value = "${module.FE_Subnet.AddressPrefix}"
}


######################################################
#BE_Subnet

output "VNet3_Subnet2_Name" {
  value = "${module.BE_Subnet.Name}"
}

output "VNet3_Subnet2_Id" {
  value = "${module.BE_Subnet.Id}"
}

output "VNet3_Subnet2_AddressPrefix" {
  value = "${module.BE_Subnet.AddressPrefix}"
}

######################################################
#Application Gateway Subnet

output "VNet3_Subnet3_Name" {
  value = "${module.AppGW_Subnet.Name}"
}

output "VNet3_Subnet3_Id" {
  value = "${module.AppGW_Subnet.Id}"
}

output "VNet3_Subnet3_AddressPrefix" {
  value = "${module.AppGW_Subnet.AddressPrefix}"
}

######################################################
#Created Azure Keyvault

output "KeyVault_Name" {
  value = "${module.KeyVault.Id}"
}

output "KeyVault_Uri" {
  value = "${module.KeyVault.URI}"
}

output "KeyVault_Sku" {
  value = "${module.KeyVault.SKU}"
}


output "KeyVault_enabled_for_disk_encryption" {
  value = "${module.KeyVault.KeyVault_enabled_for_disk_encryption}"
}

output "KeyVault_enabled_for_template_deployment" {
  value = "${module.KeyVault.KeyVault_enabled_for_template_deployment}"
}

######################################################
#Created AKS Output

output "AKSClusterName" {
  value = "${module.AKSClus.KubeName}"
}

output "AKSClusterLocation" {
  value = "${module.AKSClus.KubeLocation}"
}

output "AKSClusterRG" {
  value = "${module.AKSClus.KubeRG}"
}

output "AKSClusterVersion" {
  value = "${module.AKSClus.KubeVersion}"
}

output "AKSClusterId" {
  value = "${module.AKSClus.KubeId}"
}

output "AKSClusterFQDN" {
  value = "${module.AKSClus.KubeFQDN}"
}

output "AKSClusterAdminConfig_ClusCACert" {
  value = "${module.AKSClus.KubeAdminCFG_ClusCACert}"
}

output "AKSClusterAdminConfig_ClientKey" {
  value = "${module.AKSClus.KubeAdminCFG_ClientKey}"
}

output "AKSClusterAdminConfig_ClientCert" {
  value = "${module.AKSClus.KubeAdminCFG_ClientCertificate}"
}

output "AKSClusterAdminConfig_Password" {
  value = "${module.AKSClus.KubeAdminCFG_Password}"
}

output "AKSClusterAdminConfig_Username" {
  value = "${module.AKSClus.KubeAdminCFG_UserName}"
}

output "AKSClusterAdminConfig_Hostname" {
  value = "${module.AKSClus.KubeAdminCFG_HostName}"
}

output "AKSClusterAdminConfig" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG}"
}

output "AKSClusterAdminConfigRaw" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFGRaw}"
}

output "AKSClusterConfig" {
  sensitive = true
  value = "${module.AKSClus.KubeCfg}"
}


output "AKSClusterConfigRaw" {
  sensitive = true
  value = "${module.AKSClus.KubeCfgRaw}"
}

output "AKSClusterNodeRG" {
  value = "${module.AKSClus.NodeRG}"
}

