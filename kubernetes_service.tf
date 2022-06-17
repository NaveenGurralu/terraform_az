resource "kubernetes_service_v1" "svc" {
  metadata {
    name      = "frontend-svc"
    namespace = "frontend-app-namespace"
  }
  spec {
    selector = {
      tier = kubernetes_deployment_v1.deploy.spec.0.template.0.metadata.0.labels.tier
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}