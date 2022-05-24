metadata {
  path = "grafana-tempo"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3WCZl1QeHp4sKaxPBdDSGgm7ELGia2V5mgbem8A+nK4="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana-tempo",
  ]

  sha     = "h1:3WCZl1QeHp4sKaxPBdDSGgm7ELGia2V5mgbem8A+nK4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana-tempo",
  ]

  sha     = "8d31bd633fdd8fe67b3ac79296b3b206a40eeb6689c87de0946d87113c88b9c6"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana-tempo/helm"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana-tempo",
  ]

  sha     = "h1:uhFhT7MudnVCnVxuVAXnuBscL3Mov0G+h6eJDXh7y8U="
  retries = 0
  verbose = false
}
