metadata {
  path = "loki"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "loki"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "loki",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "62b1de177490d509c1b327352d74041631389c56ee896625f1cd13b23ed2e9a8"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "loki"
  target  = "loki/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "loki",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "loki"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "loki",
  ]

  sha     = "h1:NTmx5to74nLNYbOD404+sONO0mg8nLrHMcnyVEMwqV8="
  retries = 2
  verbose = false
}
