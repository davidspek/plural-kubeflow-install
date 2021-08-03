metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8aV8xBuTovDwdcwX0YazTPj+sipOLNP2ubI1XKUr874="
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha = "h1:8aV8xBuTovDwdcwX0YazTPj+sipOLNP2ubI1XKUr874="
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha = "ea57c1f8f291fd3b39b37558bd194ff18443e774a113781f4652cf73b7acd450"
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha = "h1:8vhbd9kku+HD7xqFw9hTEk5yJUXQilHMhQlpN4CLmq8="
}
