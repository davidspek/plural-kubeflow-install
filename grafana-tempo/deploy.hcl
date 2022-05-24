metadata {
  path = "grafana-tempo"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:3WCZl1QeHp4sKaxPBdDSGgm7ELGia2V5mgbem8A+nK4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:3WCZl1QeHp4sKaxPBdDSGgm7ELGia2V5mgbem8A+nK4="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "8d31bd633fdd8fe67b3ac79296b3b206a40eeb6689c87de0946d87113c88b9c6"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana-tempo",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana-tempo",
  ]

  sha     = "h1:uhFhT7MudnVCnVxuVAXnuBscL3Mov0G+h6eJDXh7y8U="
  retries = 1
  verbose = false
}
