##################################################################
# Network policy

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

#Default network policy deny all ingress traffic from other namespace tp pods in  terra-test-namespace

resource "kubernetes_network_policy" "terra_defaultnp_denyallin_fromotherns" {
  metadata {
    name        = "defaultnp_denyallin_fromotherns"
    namespace   = "${kubernetes_namespace.terra_test_namespace.metadata.0.name}"
  }

  spec {
    pod_selector {
      match_labels {}

    }
    ingress = [
      {
        from = [
          {
            pod_selector {}
          }
          
        ]
      }
    ]
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


