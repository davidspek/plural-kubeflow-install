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

  sha     = "c75cd96d18625078ef6fc3ea2f2e84e9a2ff3d0e33b9d5ef67ab5b6dfa96053c"
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

  sha     = "h1:BnJo4lcxWbptCCBVHMlWH7pp9WLXm6JqvzMCX22Z7HI="
  retries = 0
}
