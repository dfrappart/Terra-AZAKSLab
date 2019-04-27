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
      }
    }

    template {
      metadata {
        labels {
          app = "azure-vote-back"
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
      }
    } 

    template {
      metadata {
        labels {
          app = "azure-vote-front"
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
    }

    port {
      port = "${kubernetes_deployment.azure-vote-front.spec.0.template.0.spec.0.container.0.port.0.container_port}"
      name = "${kubernetes_deployment.azure-vote-front.spec.0.template.0.spec.0.container.0.port.0.name}"
    }

  }
}

*/