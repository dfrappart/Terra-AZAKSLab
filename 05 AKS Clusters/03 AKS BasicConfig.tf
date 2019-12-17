provider "kubernetes" {
  host                   = module.AKSClus.KubeAdminCFG_HostName
  client_certificate     = base64decode(module.AKSClus.KubeAdminCFG_ClientCertificate)
  client_key             = base64decode(module.AKSClus.KubeAdminCFG_ClientKey)
  cluster_ca_certificate = base64decode(module.AKSClus.KubeAdminCFG_ClusCACert)
}

##################################################################
# associate user & groups to cluster admin role

resource "kubernetes_cluster_role_binding" "Terra_builtin_clubsteradmin_binding_userjet" {
  metadata {
    name = "terracreated-clusteradminrole-binding-userjet"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    api_group = "rbac.authorization.k8s.io"
    kind      = "User"
    name      = var.AKSClusterAdminUSer2
  }
}

##################################################################
# associate user & groups to cluster admin role

resource "kubernetes_cluster_role_binding" "Terra_builtin_clubsteradmin_binding_userdfr" {
  metadata {
    name = "terracreated-clusteradminrole-binding-userdfr"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    api_group = "rbac.authorization.k8s.io"
    kind      = "User"
    name      = var.AKSClusterAdminUSer
  }
}



##################################################################
# Create namespace test

resource "kubernetes_namespace" "terra_test_namespace" {
  metadata {
    annotations = {
      name  = "terra_test_namespace"
      usage = "for_test_namespace"
    }

    labels = {
      namespacelabel = "testnamespace_label"
    }

    name = "terra-test-namespace"
  }
}




##################################################################
# bind namespace full admin role to AAD Group

resource "kubernetes_role_binding" "terraadminnamspace" {
  metadata {
    name      = "terransadminrolebinding"
    namespace = kubernetes_namespace.terra_test_namespace.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "admin"
  }

  subject {
    kind      = "Group"
    name      = var.AKSClusterAdminGroup
    api_group = "rbac.authorization.k8s.io"
  }
}





##################################################################
# Create K8S Resources

#Create test pod nginx

resource "kubernetes_pod" "testnginx" {
  metadata {
    name = "testnginxpod"
    labels = {
      app = "testnginxpod"
    }
    namespace = kubernetes_namespace.terra_test_namespace.metadata[0].name
  }

  spec {
    container {
      image = "nginx:1.15.12"
      name  = "testnginxpod"
    }
  }
}

#Create Service exposing test pod nginx

resource "kubernetes_service" "testnginxsvc" {
  metadata {
    name      = "testnginxsvc"
    namespace = kubernetes_namespace.terra_test_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_pod.testnginx.metadata[0].labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

#Create test deployment

resource "kubernetes_deployment" "testnginxdeployment" {
  metadata {
    name = "testnginxdeployment"
    labels = {
      app = "testnginxdeployment"
    }
    namespace = kubernetes_namespace.terra_test_namespace.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "testnginxdeployment"
      }
    }

    template {
      metadata {
        labels = {
          app = "testnginxdeployment"
        }
      }

      spec {
        container {
          image = "nginx:1.15.12"
          name  = "testnginxpoddeployment"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

#Create Service exposing test deployment nginx

resource "kubernetes_service" "testnginxsvc2" {
  metadata {
    name      = "testnginxsvc2"
    namespace = kubernetes_namespace.terra_test_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.testnginxdeployment.metadata[0].labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}


