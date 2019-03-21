######################################################
# This file defines which value are sent to output
######################################################


######################################################
#Created AKS Output

output "AKSClusterName" {
  value = "${module.AKSClusNoRbac.KubeName}"
}

output "AKSClusterLocation" {
  value = "${module.AKSClusNoRbac.KubeLocation}"
}

output "AKSClusterRG" {
  value = "${module.AKSClusNoRbac.KubeRG}"
}

output "AKSClusterVersion" {
  value = "${module.AKSClusNoRbac.KubeVersion}"
}

output "AKSClusterId" {
  value = "${module.AKSClusNoRbac.KubeId}"
}

output "AKSClusterFQDN" {
  value = "${module.AKSClusNoRbac.KubeFQDN}"
}

output "AKSClusterConfig_ClusCACert" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCFG_ClusCACert}"
}

output "AKSClusterConfig_ClientKey" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCFG_ClientKey}"
}

output "AKSClusterConfig_ClientCert" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCFG_ClientCertificate}"
}

output "AKSClusterConfig_Password" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCFG_Password}"
}

output "AKSClusterConfig_Username" {
  value = "${module.AKSClusNoRbac.KubeCFG_UserName}"
}

output "AKSClusterConfig_Hostname" {
  value = "${module.AKSClusNoRbac.KubeCFG_HostName}"
}

output "AKSClusterConfig" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCfg}"
}


output "AKSClusterConfigRaw" {
  sensitive = true
  value = "${module.AKSClusNoRbac.KubeCfgRaw}"
}

output "AKSClusterNodeRG" {
  value = "${module.AKSClusNoRbac.NodeRG}"
}

