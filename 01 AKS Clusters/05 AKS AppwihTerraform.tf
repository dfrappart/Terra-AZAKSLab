##################################################################
# Create K8S Resources
/*
#Create namespace for azure vote app
resource "kubernetes_namespace" "azap_namespace" {
    metadata {
        annotations {
            name    = "azap_namespace"
            usage   = "azap_namespace"
        }
    

        labels {
            namespacelabel = "azap_namespace"
        }

        name        = "azap-namespace"
    }
}

#Create deployment azure-vote-back

resource "kubernetes_deployment" "azure-vote-back" {
  metadata {
    name = "azure-vote-back"
    namespace = "${kubernetes_namespace.azap_namespace.metadata.0.name}"
  }

  spec {
    replicas = 1
    
    selector {
      match_labels {
        app = "azure-vote-back"
        #role = "back"
      }
    }

    template {
      metadata {
        labels {
          app = "azure-vote-back"
          #role = "back"
        }
      }

      spec {
        container {
          name = "azure-vote-back"
          image = "redis"

          resources {
            requests {
              cpu = "100m"
              memory = "128Mi"
            }

            limits {
              cpu = "250m"
              memory = "256Mi"
            }
          }
          port {
            container_port = 6379
            name = "redis"
          }
        }
      }
    }

  }
}


#Create service for azure-vote-back

resource "kubernetes_service" "azure-vote-back" {
  metadata {
    name = "${kubernetes_deployment.azure-vote-back.metadata.0.name}"
    namespace = "${kubernetes_namespace.azap_namespace.metadata.0.name}"
  }

  spec {
    selector {
      app = "${kubernetes_deployment.azure-vote-back.metadata.0.name}"
      #role = "back" #"${kubernetes_deployment.azure-vote-back.spec.1.selector.0.match_labels.0.role}"
    }

    port {
      port = "${kubernetes_deployment.azure-vote-back.spec.0.template.0.spec.0.container.0.port.0.container_port}"
      name = "${kubernetes_deployment.azure-vote-back.spec.0.template.0.spec.0.container.0.port.0.name}"
    }
  }
}



#Create deployment azure-vote-front

resource "kubernetes_deployment" "azure-vote-front" {
  metadata {
    name = "azure-vote-front"
    namespace = "${kubernetes_namespace.azap_namespace.metadata.0.name}"

  }

  spec {
    replicas = 3

    selector {
      match_labels {
        app = "azure-vote-front" 
        #role = "front"
      }
    } 

    template {
      metadata {
        labels {
          app = "azure-vote-front"
          #role = "front"
        }
      }

      spec {
        container {
          name = "azure-vote-front"
          image = "microsoft/azure-vote-front:v1"

          resources {
            requests {
              cpu = "100m"
              memory = "128Mi"

            }

            limits {
              cpu = "200m"
              memory = "256Mi"
            }


          }

          port {
            container_port = 80
            name = "az-vote-front"

          }

          env {
            name = "${kubernetes_deployment.azure-vote-back.spec.0.template.0.spec.0.container.0.port.0.name}"
            value = "${kubernetes_deployment.azure-vote-back.metadata.0.name}"

          }
        }
      }
    }  
  }
}

#Create service azure-vote-front

resource "kubernetes_service" "azure-vote-front" {
  metadata {
    name = "${kubernetes_deployment.azure-vote-front.metadata.0.name}"
    namespace = "${kubernetes_namespace.azap_namespace.metadata.0.name}"
  }

  spec {
    type = "LoadBalancer"

    selector {
      app = "${kubernetes_deployment.azure-vote-front.metadata.0.name}"
      #role = "front" #"${kubernetes_deployment.azure-vote-front.spec.0.selector.0.match_labels.0.role}"
    }

    port {
      port = "${kubernetes_deployment.azure-vote-front.spec.0.template.0.spec.0.container.0.port.0.container_port}"
      name = "${kubernetes_deployment.azure-vote-front.spec.0.template.0.spec.0.container.0.port.0.name}"
    }

  }
}


##################################################################
# Network policy

/*

#Default network policy deny all in namespace terra-test-namespace ingress

resource "kubernetes_network_policy" "terra_defaultnp_denyallin_ns_terra-test-namespace" {
  metadata {
    name        = "defaultnp-denyall-in"
    namespace   = "${kubernetes_namespace.terra_test_namespace.metadata.0.name}"
  }

  spec {
    pod_selector {}
    ingress = []
    policy_types = ["Ingress"]

  }

  


}

#Default network policy deny all in namespace terra-test-namespace egress

resource "kubernetes_network_policy" "terra_defaultnp_denyalleg_ns_terra-test-namespace" {
  metadata {
    name        = "defaultnp-denyall-eg"
    namespace   = "${kubernetes_namespace.azap_namespace.metadata.0.name}"
  }

  spec {
    pod_selector {}
    egress = []
    policy_types = ["Egress"]

  }

  


}

#Network policy allowing external traffic on testnginxpod

resource "kubernetes_network_policy" "Allow-External" {
  metadata {
    name = "allow-external"
    namespace = "${kubernetes_namespace.azap_namespace.metadata.0.name}"

  }

  spec {
    pod_selector {
      match_labels {
        app = "azure-vote"
        role = "front"
      }
    }
    ingress = [
      {
        from = []
      }
    ]
    policy_types = ["Ingress"]

  }
}


*/