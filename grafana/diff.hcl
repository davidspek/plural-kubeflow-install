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

  sha = "9d645087377fcf95986e5d76a4abba4898fb0c29e1ea4179ee083418409ccf0e"
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

  sha = "h1:A8H1qmtxhD+G4bsq0kHsGwLwM4iPF8/eJLn2TuAIeD8="
}
