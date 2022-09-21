resource "kubernetes_deployment" "terraform" {
  for_each = var.kubernetes_deployments
  metadata {
    name      = each.key
    namespace = each.value.namespace
    labels = {
      "app.kubernetes.io/name" = each.key
    }
  }

  spec {
    replicas = each.value.replicas

    selector {
      match_labels = {
        "app.kubernetes.io/name" = each.key
      }
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = each.key
        }
      }

      spec {
        container {
          image = each.value.image
          name  = each.key
        }
      }
    }
  }
}

