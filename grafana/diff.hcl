metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:EzdFPq628GnL5jk2SdO6hJ0xtUn2FjaDnNknjubcetM="
  retries = 0
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

  sha     = "h1:EzdFPq628GnL5jk2SdO6hJ0xtUn2FjaDnNknjubcetM="
  retries = 0
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

  sha     = "d5c78f5c4dee6b6707d1f91a4e3bc66a844a26c7a36064d59460e4dc744b96ee"
  retries = 0
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

  sha     = "h1:oWGsYlhXGL99LGIfYhSnjNbw1SPy6TxmvoIRss0sTRE="
  retries = 0
}
