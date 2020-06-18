provider "kubernetes"{
    config_context_cluster   = "minikube"
    }

resource "kubernetes_deployment" "mydeploy" {
  metadata {
    name = "replicaset-example"
    labels = {
      Name = "Myreplica"
    }
  }

  spec {
    replicas = 3


    selector {
      match_labels = {
        env = "dev"
        dc = "IN"
        app = "webserver"
        
      }
    
    }

    template {
      metadata {
        labels = {
          env = "dev"
        dc = "IN"
        app = "webserver"
        }
      }

      spec {
        container {
          image = "vimal13/apache-webserver-php"
          name  = "myreplica-deploy"
        }
      }
    }
  }
}   
