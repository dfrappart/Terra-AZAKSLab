######################################################################
# RG for AKS managed cluster
######################################################################


module "AKSClusterRandomPrefix" {
    #Module source
    source = "github.com/dfrappart/Terra-AZModuletest//Modules//00 RandomString/"

    #Module variables
    stringlenght        = "4"
    stringspecial       = "false"
    stringupper         = "false"
    
}

######################################################################
# This file deploy an AKS cluster in advanced networking mode
######################################################################


/*
module "AKSClus" {
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Modules//44-2 AKS ClusterwithRBAC/"

  #Module variable
  AKSRGName           = "${data.azurerm_resource_group.AKSRG.name}"
  AKSClusName         = "${var.AKSClusterwithRBACName}"
  AKSprefix           = "${module.AKSClusterRandomPrefix.Result}"
  AKSLocation         = "${var.AzureRegion}"
  AKSSubnetId         = "${data.azurerm_subnet.AKSwithRBACSubnet.id}"
  K8SSPId             = "${data.azurerm_key_vault_secret.AKSSP_AppId.value}"
  K8SSPSecret         = "${data.azurerm_key_vault_secret.AKSSP_AppSecret.value}"
  AKSLAWId            = "${data.azurerm_log_analytics_workspace.AKSLabWS.id}"
  AADTenantId         = "${var.AzureTenantID}"
  AADServerAppSecret  = "${data.azurerm_key_vault_secret.AKS_AADServer_AppSecret.value}"
  AADServerAppId      = "${data.azurerm_key_vault_secret.AKS_AADServer_AppID.value}"
  AADCliAppId         = "${data.azurerm_key_vault_secret.AKS_AADClient_AppId.value}"
  PublicSSHKey        = "${data.azurerm_key_vault_secret.SSHPublicKey.value}"
  EnvironmentTag      = "${var.EnvironmentTag}"
  EnvironmentUsageTag = "${var.EnvironmentUsageTag}"
  OwnerTag            = "${var.OwnerTag}"
  ProvisioningDateTag = "${var.ProvisioningDateTag}"
  #the following parameters are optional because defined with default values
  AKSSVCCIDR          = "172.19.0.0/16"
  AKSDockerBridgeCIDR = "172.17.0.1/16"

}

*/

#Creating the AKS Cluster with RBAC Enabled and AAD integration

resource "azurerm_kubernetes_cluster" "AKSwRBAC" {

  count               = "${terraform.workspace == "Prod" ? 1 : 0}"
  name                = "${var.AKSClusterwithRBACName}"
  location            = "${var.AzureRegion}"
  resource_group_name = "${var.RGAKSName}"
  
  agent_pool_profile {
  name                = "${var.AKSClusterwithRBACName}"
    name              = "${lower(var.EnvironmentTag)}agcfg"
    count             = "${var.AKSNodeCount}" 
    vm_size           = "${var.AKSNodeInstanceType}" 
    os_type           = "${var.AKSNodeOSType}"
    os_disk_size_gb   = "${var.AKSNodeOSDiskSize}"
    vnet_subnet_id    = "${data.azurerm_subnet.AKSwithRBACSubnet.id}"
    max_pods          = "${var.AKSMaxPods}"


  }
  
  dns_prefix = "${module.AKSClusterRandomPrefix.Result}"

  service_principal {
    client_id         = "${data.azurerm_key_vault_secret.AKSSP_AppId.value}"
    client_secret     = "${data.azurerm_key_vault_secret.AKSSP_AppSecret.value}"

  }

  addon_profile {
    http_application_routing {
      enabled = "${var.IshttproutingEnabled}"
    }
    
    oms_agent {
      enabled                 = true
      log_analytics_workspace_id = "${data.azurerm_log_analytics_workspace.AKSLabWS.id}"
    }
  }
  
  kubernetes_version = "${var.KubeVersion}"


  linux_profile {
    admin_username = "${var.AKSAdminName}"

    ssh_key {
      key_data = "${data.azurerm_key_vault_secret.SSHPublicKey.value}"
    }
  }

  network_profile {
    network_plugin        = "azure"
    #network_policy        = "calico"
    dns_service_ip        = "${cidrhost(var.AKSSVCCIDR, var.AKSDNSSVCIPModfier)}"
    docker_bridge_cidr    = "${var.AKSDockerBridgeCIDR}"
    service_cidr          = "${var.AKSSVCCIDR}"

  }

  role_based_access_control {
    enabled           = true

    azure_active_directory {
      client_app_id       = "${data.azurerm_key_vault_secret.AKS_AADClient_AppId.value}"
      server_app_id       = "${data.azurerm_key_vault_secret.AKS_AADServer_AppID.value}"
      server_app_secret   = "${data.azurerm_key_vault_secret.AKS_AADServer_AppSecret.value}"
      tenant_id           = "${var.AzureTenantID}"
    }

  }


  tags {
    Environment       = "${var.EnvironmentTag}"
    Usage             = "${var.EnvironmentUsageTag}"
    Owner             = "${var.OwnerTag}"
    ProvisioningDate  = "${var.ProvisioningDateTag}"
  }
}

#Creating the AKS Cluster without RBAC Enabled and AAD integration

resource "azurerm_kubernetes_cluster" "AKSnoRBAC" {

  count               = "${terraform.workspace == "Dev" ? 1 : 0}"
  name                = "${var.AKSClusterwithRBACName}"
  location            = "${var.AzureRegion}"
  resource_group_name = "${var.RGAKSName}"
  
  agent_pool_profile {
  name                = "${var.AKSClusterwithRBACName}"
    name              = "${lower(var.EnvironmentTag)}agcfg"
    count             = "${var.AKSNodeCount}" 
    vm_size           = "${var.AKSNodeInstanceType}" 
    os_type           = "${var.AKSNodeOSType}"
    os_disk_size_gb   = "${var.AKSNodeOSDiskSize}"
    vnet_subnet_id    = "${data.azurerm_subnet.AKSNoRBACSubnet.id}"
    max_pods          = "${var.AKSMaxPods}"


  }
  
  dns_prefix = "${module.AKSClusterRandomPrefix.Result}"

  service_principal {
    client_id         = "${data.azurerm_key_vault_secret.AKSSP_AppId.value}"
    client_secret     = "${data.azurerm_key_vault_secret.AKSSP_AppSecret.value}"

  }

  addon_profile {
    http_application_routing {
      enabled = "${var.IshttproutingEnabled}"
    }
    
    oms_agent {
      enabled                 = true
      log_analytics_workspace_id = "${data.azurerm_log_analytics_workspace.AKSLabWS.id}"
    }
  }
  
  kubernetes_version = "${var.KubeVersion}"


  linux_profile {
    admin_username = "${var.AKSAdminName}"

    ssh_key {
      key_data = "${data.azurerm_key_vault_secret.SSHPublicKey.value}"
    }
  }

  network_profile {
    network_plugin        = "azure"
    #network_policy        = "calico"
    dns_service_ip        = "${cidrhost(var.AKSSVCCIDR, var.AKSDNSSVCIPModfier)}"
    docker_bridge_cidr    = "${var.AKSDockerBridgeCIDR}"
    service_cidr          = "${var.AKSSVCCIDR}"

  }

/*
  role_based_access_control {
    enabled           = true

    azure_active_directory {
      client_app_id       = "${data.azurerm_key_vault_secret.AKS_AADClient_AppId.value}"
      server_app_id       = "${data.azurerm_key_vault_secret.AKS_AADServer_AppID.value}"
      server_app_secret   = "${data.azurerm_key_vault_secret.AKS_AADServer_AppSecret.value}"
      tenant_id           = "${var.AzureTenantID}"
    }

  }
*/

  tags {
    Environment       = "${var.EnvironmentTag}"
    Usage             = "${var.EnvironmentUsageTag}"
    Owner             = "${var.OwnerTag}"
    ProvisioningDate  = "${var.ProvisioningDateTag}"
  }
}


data "template_file" "templateakswnetpol" {
  template = "${file("./Templates/templateakswnetpolw.json")}"
}



#Creating the AKS Cluster with RBAC Enabled, AAD Integration and Netpol Calico
/*
resource "azurerm_template_deployment" "Template-AKSwNetPol" {
  count = "${terraform.workspace == "Prod" ? 1 : 0}"
  name                = "azureakswnetpol"
  resource_group_name = "${var.RGAKSName}"

  template_body = "${data.template_file.templateAZFW.rendered}"

  parameters {

  }

  deployment_mode = "Incremental"
}

*/
