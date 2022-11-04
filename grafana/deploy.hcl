metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 2
  verbose = false
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

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "698f86b5ca82ef3d2d9a8330136e12b94fbc241a9240d894709a7ce1c392c029"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:bI53t6N/bXSBZlL1WkfM/LTWVt6QXlTVyXapZtLz/k0="
  retries = 2
  verbose = false
}
