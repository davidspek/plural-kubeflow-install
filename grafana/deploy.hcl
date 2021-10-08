metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana",
  ]

  sha     = "h1:dLCWBGM9SBt+Ep5ldXfYFj5bhkiNYu/XEFae6Fjk+vA="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d6ef8edc5618114b74080a4a565f11dc7a7aca3603562c3578ceac0fef0c770b"
  retries = 0
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:Gm1IoQJbokfL795eoM6By4W4DISc8119EopPnuPAMWw="
  retries = 0
}
