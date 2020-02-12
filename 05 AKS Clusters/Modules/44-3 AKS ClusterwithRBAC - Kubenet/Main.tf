################################################################
#This module allows the creation of an AKS Cluster
################################################################


#Creating the AKS Cluster with RBAC Enabled and AAD integration

resource "azurerm_kubernetes_cluster" "TerraAKSwithRBAC" {

  lifecycle {
    ignore_changes = [
      #Ignore change for node count since it is autoscaling
      default_node_pool[0].node_count

    ]
  }
  
  name                = var.AKSClusName
  location            = var.AKSLocation
  resource_group_name = var.AKSRGName
  node_resource_group = var.AKSNodesRG

  default_node_pool {
    name                       = lower(var.AKSAgentPoolName)
    vm_size                    = var.AKSNodeInstanceType
    availability_zones         = var.AKSAZ
    enable_auto_scaling        = var.EnableAKSAutoScale      
    enable_node_public_ip      = var.EnableNodePublicIP        
    max_pods                   = var.AKSMaxPods
    os_disk_size_gb            = var.AKSNodeOSDiskSize   
    type                       = var.AKSNodePoolType
    vnet_subnet_id             = var.AKSSubnetId
    min_count                  = var.MinAutoScaleCount
    max_count                  = var.MaxAutoScaleCount
    node_count                 = var.AKSNodeCount


  }
  
  dns_prefix = lower(var.AKSprefix)

  service_principal {
    client_id         = var.K8SSPId
    client_secret     = var.K8SSPSecret

  }

  addon_profile {
    
    /*
    http_application_routing {
      enabled = var.IshttproutingEnabled
    }
    */

    oms_agent {
      enabled                     = var.IsOMSAgentEnabled
      log_analytics_workspace_id  = lower(var.AKSLAWId)
    }

    kube_dashboard {
      enabled = true
    }
  }
  
  kubernetes_version                = var.KubeVersion
  api_server_authorized_ip_ranges   = var.APIAccessList
  enable_pod_security_policy        = var.EnablePodPolicy

  linux_profile {
    admin_username  = var.AKSAdminName

    ssh_key {
      key_data      = var.PublicSSHKey
    }
  }

  network_profile {
    network_plugin        = "kubenet"
    network_policy        = var.NetworkPolicyPlugin
    #dns_service_ip        = cidrhost(var.AKSSVCCIDR, var.AKSDNSSVCIPModfier)
    #docker_bridge_cidr    = var.AKSDockerBridgeCIDR
    #service_cidr          = var.AKSSVCCIDR
    pod_cidr              = var.AKSPodCIDR
    load_balancer_sku     = var.AKSLBSku

  }

  role_based_access_control {
    enabled               = true

    azure_active_directory {
      client_app_id       = var.AADCliAppId
      server_app_id       = var.AADServerAppId
      server_app_secret   = var.AADServerAppSecret
      tenant_id           = var.AADTenantId
    }

  }

  tags = {
    Environment           = var.EnvironmentTag
    Usage                 = var.EnvironmentUsageTag
    Owner                 = var.OwnerTag
    ProvisioningDate      = var.ProvisioningDateTag
  }
}

