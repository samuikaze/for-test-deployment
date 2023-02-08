resource "kubernetes_namespace_v1" "test-deploy" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_deployment_v1" "test-deploy-deployment" {
  metadata {
    name = var.app_name
    namespace = var.namespace_name

    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name = var.app_name
          image = var.image_name

          port {
            protocol = "TCP"
            container_port = var.host_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "test-deploy-service" {
  metadata {
    name = var.app_name
    namespace = var.namespace_name
  }

  spec {
    type = "ClusterIP"
    selector = {
      app = var.app_name
    }

    port {
      protocol = "TCP"
      port = var.ingress_port
      target_port = var.host_port
    }
  }
}

resource "kubernetes_ingress_v1" "test-deploy-ingress" {
  metadata {
    name = format("%s-ingress", var.app_name)
    namespace = var.namespace_name
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/use-regex" = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
      "nginx.ingress.kubernetes.io/body-size" = "102400m"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "102400m"
      "nginx.ingress.kubernetes.io/proxy-connect-timeout" = "7200"
      "nginx.ingress.kubernetes.io/proxy-read-timeout" = "7200"
      "nginx.ingress.kubernetes.io/proxy-send-timeout" = "7200"
      "nginx.ingress.kubernetes.io/proxy-max-temp-file-size" = "0"
      "nginx.ingress.kubernetes.io/proxy-buffering" = "off"
      "nginx.ingress.kubernetes.io/proxy_max_temp_file_size" = "102400m"
      "nginx.ingress.kubernetes.io/large-client-header-buffers" = "8 52m"
      "nginx.ingress.kubernetes.io/client-header-buffer-size" = "52m"
      "nginx.ingress.kubernetes.io/client-body-buffer-size" = "102400m"
      "nginx.ingress.kubernetes.io/client-max-body-size" = "102400m"
      "nginx.ingress.kubernetes.io/client_body_timeout" = "7200"
      "nginx.ingress.kubernetes.io/service-upstream" = true
      "nginx.org/client-max-body-size" = "102400m"
      "nginx.org/websocket-services" = "core-service"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/test/(.*)"
          path_type = "Prefix"
          backend {
            service {
              name = var.app_name
              port {
                number = var.ingress_port
              }
            }
          }
        }
      }
    }
  }
}
