/*
data "template_file" "templateakswnetpol" {
  template = "${file("./Templates/templateakswnetpol.json")}"
}



#Creating the AKS Cluster with RBAC Enabled, AAD Integration and Netpol Calico

resource "azurerm_template_deployment" "Template-AKSwNetPol" {
  count = "${terraform.workspace == "Prod" ? 1 : 0}"
  name                = "azureakswnetpol"
  resource_group_name = "${var.RGAKSName}"

  template_body = "${data.template_file.templateakswnetpol.rendered}"

  parameters {

    AKSName               = "${var.AKSClus}"
    AKSLocation           = "${var.AzureRegion}"
    EnvironnmentTag       = "${var.EnvironmentTag}"
    EnvironmentUsageTag   = "${var.EnvironmentUsageTag}"
    OwnerTag              = "${var.OwnerTag}"
    ProvisioningDateTag   = "${var.ProvisioningDateTag}"
    KubeVersion           = "${var.KubeVersion}"
    AKSDNSPrefix          = "${module.AKSClusterRandomPrefix.Result}"
#    RBACStatus            = true
#    PodSecurityStatus     = true
#    NodeCount             = "3"
#    NodeCountMin          = "1"
#    NodeCountMax          = "6"
    NodeSize              = "${var.AKSNodeInstanceType}"
    AKSOSDiskSize         = "${var.AKSNodeOSDiskSize}"
    AKSSubnetId           = "${data.azurerm_subnet.AKSwithRBACSubnet.id}"
    AKSOSType             = "${var.AKSNodeOSType}"
    AKSMaxPodNumber       = "${var.AKSMaxPods}"
#    AKSAutoscalingStatus  = true
    AKAgentPoolName       = "${lower(var.EnvironmentTag)}agcfg"
    AKSAdminName          = "${var.AKSAdminName}"
    AKSSSH                = "${data.azurerm_key_vault_secret.SSHPublicKey.value}"
    AKSSPAppId            = "${data.azurerm_key_vault_secret.AKSSP_AppId.value}"
    AKSSPAppSecret        = "${data.azurerm_key_vault_secret.AKSSP_AppSecret.value}"
#    AKSCNI                = "azure"
#    AKSPolicy             = "calico"
    AKSSVCCidr            = "${var.AKSSVCCIDR}"
    AKSDNSIP              = "${cidrhost(var.AKSSVCCIDR, var.AKSDNSSVCIPModfier)}"
    AKSDockerBridgeCidr   = "${var.AKSDockerBridgeCIDR}"
    AKSAADClientId        = "${data.azurerm_key_vault_secret.AKS_AADClient_AppId.value}"
    AKSAADServerId        = "${data.azurerm_key_vault_secret.AKS_AADServer_AppID.value}"
    AKSAADServerSecret    = "${data.azurerm_key_vault_secret.AKS_AADServer_AppSecret.value}"
    AKSAADTenantId        = "${var.AzureTenantID}"
    

  }

  deployment_mode = "Incremental"
}

*/