##################################################################
# Create K8S Resources
/*
#Create namespace for azure vote app
resource "kubernetes_namespace" "azap_namespace" {
  metadata {
    annotations = {
      name  = "azap_namespace"
      usage = "azap_namespace"
    }

    labels = {
      namespacelabel = "azap_namespace"
    }

    name = "azap-namespace"
  }
}
*/
#Create deployment azure-vote-back
/*
resource "kubernetes_deployment" "azure-vote-back" {
  metadata {
    name      = "azure-vote-back"
    namespace = "azap-namespace"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app  = "azure-vote-back"
        role = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app  = "azure-vote-back"
          role = "backend"
        }
      }

      spec {
        container {
          name  = "azure-vote-back"
          image = "redis"

          resources {
            requests {
              cpu    = "100m"
              memory = "128Mi"
            }

            limits {
              cpu    = "200m"
              memory = "256Mi"
            }
          }

          port {
            container_port = 6379
            name           = "redis"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "azure-vote-back" {
  metadata {
    name      = "azure-vote-back"
    namespace = "azap-namespace"
  }

  spec {
    port {
      port = "6379"
      name = "redis"
    }

    selector = {
      app = "azure-vote-back"
    }
  }
}
*/

/*
resource "kubernetes_deployment" "azure-vote-front" {
  metadata {
    name      = "azure-vote-front"
    namespace = "azap-namespace"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app  = "azure-vote-front"
        role = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app  = "azure-vote-front"
          role = "frontend"
        }
      }

      spec {
        container {
          name  = "azure-vote-front"
          image = "microsoft/azure-vote-front:v1"

          resources {
            limits {
              cpu    = "256m"
              memory = "256Mi"
            }

            requests {
              cpu    = "100m"
              memory = "128Mi"
            }
          }

          port {
            container_port = 80
          }

          env {
            name  = "REDIS"
            value = "azure-vote-back"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "azure-vote-front" {
  metadata {
    name      = "azure-vote-front"
    namespace = "azap-namespace"
  }

  spec {
    type = "LoadBalancer"

    port {
      port = 80
    }

    selector = {
      app = "azure-vote-front"
    }
  }
}
*/
##################################################################
# Network policy

#Default network policy deny all in namespace azap-namespace ingress
/*
resource "kubernetes_network_policy" "terra_defaultnp_denyallin_ns_azap" {
  metadata {
    name      = "defaultnp-denyall-in"
    namespace = "azap-namespace"
  }

  spec {
    pod_selector {
    }
    policy_types = ["Ingress"]
  }
}
*/

/*
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

*/

#Network policy allowing external traffic on azure-vote-front
/*
resource "kubernetes_network_policy" "Allow-External-azapfront" {
  metadata {
    name      = "allow-external"
    namespace = "azap-namespace"
  }

  spec {
    pod_selector {
      match_labels = {
        app  = "azure-vote-front"
        role = "frontend"
      }
    }
    ingress {
    }
    policy_types = ["Ingress"]
  }
}

#Network policy allowing traffic on azure-vote-back from azure-vote-front

resource "kubernetes_network_policy" "allowin-fromazapfront" {
  metadata {
    name      = "allowin-fromazapfront"
    namespace = "azap-namespace"
  }

  spec {
    pod_selector {
      match_labels = {
        app  = "azure-vote-back"
        role = "backend"
      }
    }

    ingress {
      from {
        pod_selector {
          match_labels = {
            app  = "azure-vote-front"
            role = "frontend"
          }
        }
      }
    }

    policy_types = ["Ingress"]
  }
}
*/
