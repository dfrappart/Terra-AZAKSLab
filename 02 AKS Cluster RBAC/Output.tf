######################################################
# This file defines which value are sent to output
######################################################



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

output "AKSClusterAdminConfigRaw" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFGRaw}"
}

output "AKSClusterAdminConfig" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG}"
}

output "AKSClusterAdminConfig_Username" {
  value = "${module.AKSClus.KubeAdminCFG_UserName}"
}

output "AKSClusterAdminConfig_Hostname" {
  value = "${module.AKSClus.KubeAdminCFG_HostName}"
}

output "AKSClusterAdminConfig_Password" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG_Password}"
}


output "AKSClusterAdminConfig_ClientKey" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG_ClientKey}"
}

output "AKSClusterAdminConfig_ClusCACert" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG_ClusCACert}"
}

output "AKSClusterAdminConfig_ClientCert" {
  sensitive = true
  value = "${module.AKSClus.KubeAdminCFG_ClientCertificate}"
}


output "AKSClusterNodeRG" {
  value = "${module.AKSClus.NodeRG}"
}

