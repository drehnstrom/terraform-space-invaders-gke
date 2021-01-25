resource "kubernetes_service" "si-service" {
  metadata {
    name      = "space-invaders-service"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.si-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}


output "lb_status" {
  value = kubernetes_service.si-service.status
}
