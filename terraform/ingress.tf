resource "kubernetes_ingress" "nginx_ingress" {
  metadata {
    name = "nginx-ingress"
    namespace = "default"
  }

  spec {
    backend {
      service_name = "nginx-service"
      service_port = 80
    }
  }
}
