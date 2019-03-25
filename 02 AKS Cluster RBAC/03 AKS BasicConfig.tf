



provider "kubernetes" {
    host                        = "${module.AKSClus.KubeAdminCFG_HostName}"
    #username                    = "${module.AKSClus.KubeAdminCFG_UserName}"
    #password                    = "${module.AKSClus.KubeAdminCFG_Password}"
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

resource "kubernetes_cluster_role_binding" "Terra_builtin_clubsteradmin_binding_group" {

    metadata {
        name = "terracreated-clusteradmin-role-binding-group"
    }

    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "cluster-admin"
    }

    subject {
        api_group   = "rbac.authorization.k8s.io"
        kind        = "Group"
        name        = "${var.AKSClusterAdminGroup}"

    }

}

/*
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

*/



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