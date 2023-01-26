metadata {
  path = "argo-workflows"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:kPEauVDg5voZG1BQ1rWqhlk3x6jRwaMbvkaxjo/Gy0c="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:kPEauVDg5voZG1BQ1rWqhlk3x6jRwaMbvkaxjo/Gy0c="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-workflows",
  ]

  sha     = "h1:kPEauVDg5voZG1BQ1rWqhlk3x6jRwaMbvkaxjo/Gy0c="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9586bfc7c68484db6870f2bac284e55d2756966cd89c303841483b17c2928c44"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-workflows",
  ]

  sha     = "h1:FtyHzEhEaLNLDGcU3J4DqEZCT0/LCYPvyf/Vg0VjyoE="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-workflows",
  ]

  sha     = "h1:0qRqmtk7V/v9zR06X8d3iMBxPasp6H96OZ962ji3q6k="
  retries = 2
  verbose = false
}
