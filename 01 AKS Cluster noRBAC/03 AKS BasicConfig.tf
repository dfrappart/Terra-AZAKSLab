



provider "kubernetes" {
    host                        = "${module.AKSClusNoRbac.KubeCFG_HostName}"
    client_certificate          = "${base64decode(module.AKSClusNoRbac.KubeCFG_ClientCertificate)}"
    client_key                  = "${base64decode(module.AKSClusNoRbac.KubeCFG_ClientKey)}"
    cluster_ca_certificate      = "${base64decode(module.AKSClusNoRbac.KubeCFG_ClusCACert)}"
}




resource "kubernetes_namespace" "terra_dev_namespace" {
    metadata {
        annotations {
            name = "terra_dev_namespace"
            usage = "for_dev_namespace"
        }
    

        labels {
            namespacelabel = "testnamespace_label"
        }

        name = "terra-dev-namespace"
    }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources{
            limits{
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests{
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector {
      app = "${kubernetes_pod.example.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    labels {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"
    }
  }
}

