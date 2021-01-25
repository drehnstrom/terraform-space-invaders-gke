resource "kubernetes_deployment" "si-deployment" {
  metadata {
    name = "space-invaders-deployment"
    labels = {
      App = "space-invaders"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 4
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "space-invaders"
      }
    }
    template {
      metadata {
        labels = {
          App = "space-invaders"
        }
      }
      spec {
        container {
          image = "drehnstrom/space-invaders:latest"
          name  = "space-invaders"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}