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
      match_expressions {
        key = "dc"
        operator = "In"
        values = ["US" , "EU"]
        
      }
 
    }

    template {
      metadata {
        labels = {
           dc = "EU"
      
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
