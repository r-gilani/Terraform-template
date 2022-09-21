variable "kubernetes_deployments" {
  type = map(any)
  default = {
    "nginx" = {
      "namespace" = "default"
      "replicas"  = "3"
      "image"     = "nginx:latest"
    },
    "httpd" = {
      "namespace" = "default"
      "replicas"  = "1"
      "image"     = "httpd:latest"
    }
  }
}

