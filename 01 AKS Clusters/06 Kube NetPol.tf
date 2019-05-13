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
/*
resource "kubernetes_network_policy" "terra_defaultnp_denyalleg_ns_terra-test-namespace" {
  metadata {
    name        = "defaultnp-denyall-eg"
    namespace   = "${kubernetes_namespace.terra_test_namespace.metadata.0.name}"
  }

  spec {
    pod_selector {}
    egress = []
    policy_types = ["Egress"]

  }

  


}

*/

#Network policy allowing external traffic on testnginxpod
/*
resource "kubernetes_network_policy" "Allow-External" {
  metadata {
    name = "allow-external"
    namespace = "terra-test-namespace"

  }

  spec {
    pod_selector {
      match_labels {
        app = "testnginxpod"
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

#Network policy allowing external traffic on Azure app
/*
resource "kubernetes_network_policy" "Allow-External-AzApp" {
  metadata {
    name = "allow-external-azapp"
    namespace = "terra-test-namespace"

  }

  spec {
    pod_selector {
      match_labels {
        app = "azure-vote-front"
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

#Network policy allowing Egress traffic on Azure app front to azure app back
/*
resource "kubernetes_network_policy" "Allow-Egress-AzAppFront" {
  metadata {
    name = "allow-egress-azappfront"
    namespace = "terra-test-namespace"

  }

  spec {
    pod_selector {
      match_labels {
        app = "azure-vote-front"
      }
    }
    egress = [
      {
        to = {
          pod_selector {
            match_labels {
              app = "azure-vote-back"
            }
          }
        }
      }
    ]
    policy_types = ["Egress"]

  }
}
*/
#Network policy allowing ingress traffic from Azure app front to azure app back
/*
resource "kubernetes_network_policy" "Allow-Ingress-AzAppBack" {
  metadata {
    name = "allow-ingress-azappback"
    namespace = "terra-test-namespace"

  }

  spec {
    pod_selector {
      match_labels {
        app = "azure-vote-back"
      }
    }
    ingress = [
      {
        from = [
          {
            pod_selector {
              match_labels {
                app = "azure-vote-front"
              }
            }
          }
        ]
      }
    ]
    policy_types = ["Ingress"]

  }
}
*/


#Network policy Allow traffic from a namespace
