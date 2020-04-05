resource "kubernetes_namespace" "n" {
  metadata {
    name = "space-invaders"
  }
}