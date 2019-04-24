
provider "kubernetes" {
    host                        = "${module.AKSClus.KubeAdminCFG_HostName}"
    client_certificate          = "${base64decode(module.AKSClus.KubeAdminCFG_ClientCertificate)}"
    client_key                  = "${base64decode(module.AKSClus.KubeAdminCFG_ClientKey)}"
    cluster_ca_certificate      = "${base64decode(module.AKSClus.KubeAdminCFG_ClusCACert)}"
}



##################################################################
# associate user & groups to cluster admin role

resource "kubernetes_cluster_role_binding" "Terra_builtin_clubsteradmin_binding_user" {

    metadata {
        name = "terracreated-clusteradminrole-binding-user"
    }

    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "cluster-admin"
    }

    subject {
        api_group   = "rbac.authorization.k8s.io"
        kind        = "User"
        name        = "${var.AKSClusterAdminUSer}"

    }

}

##################################################################
# create custom role with full access on K8S


resource "kubernetes_cluster_role" "terra_clusteradmin" {
    metadata {
        name = "terracreatedclusterrole"
        annotations {
            name = "terracreatedclusterrole"
            usage = "foradminclusterrole"
        }
        labels {
            name = "terracreatedclusterrole"
            usage = "foradminclusterrole" 

        }

    }


    rule {
        api_groups = ["*"]
        resource_names = [""]
        resources =  ["ResourceAll"]
        verbs = ["VerbAll"]


    }


}




##################################################################
# Create namespace test


resource "kubernetes_namespace" "terra_test_namespace" {
    metadata {
        annotations {
            name = "terra_test_namespace"
            usage = "for_test_namespace"
        }
    

        labels {
            namespacelabel = "testnamespace_label"
        }

        name = "terra-test-namespace"
    }
}



##################################################################
# Create role with full access on created namespace
#Not necessary, use the built-in role admin in the following binding
#not usre it works either :p


resource "kubernetes_role" "terransadmin" {
  metadata {
    namespace = "terra-test-namespace"   #No interpolation on namespace resource object T_T
    name = "terracreated-nsadmin"
    labels {
      test = "terracreatedrole"
    }
  }

  rule {
    api_groups = [""]
    resources = ["*"]
    verbs = ["*"]

  }

}



##################################################################
# bind namespace full admin role to AAD Group


resource "kubernetes_role_binding" "terraadminnamspace" {
  metadata {
    name = "terransadminrolebinding"
    namespace = "terra-test-namespace"

  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = "admin"
  }

  subject {
    kind = "Group"
    name = "${var.AKSClusterAdminGroup}"
    api_group = "rbac.authorization.k8s.io"
  }
}


##################################################################
# Create network policy to limit traffic inside the namespace

resource "kubernetes_network_policy" "terranetpoltons" {
  metadata {
    name = "terranetpol-test"
    namespace = "terra-test-namespace"

  }

  spec {
    pod_selector {

    }


    ingress = [
      {

        from = [
          {
            namespace_selector {
              match_labels = {
                namespacelabel = "testnamespace_label"
              }
            }
          }
        ]
      }
    ]

    egress = [{}]

    policy_types = ["Ingress", "Egress"]
    
  }
}



##################################################################
# Create K8S Resources

/*

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



*/