metadata {
  path = "loki"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "loki",
  ]

  sha     = "62b1de177490d509c1b327352d74041631389c56ee896625f1cd13b23ed2e9a8"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "loki/helm"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "loki",
  ]

  sha     = "h1:NTmx5to74nLNYbOD404+sONO0mg8nLrHMcnyVEMwqV8="
  retries = 0
  verbose = false
}
