metadata {
  path = "argo-cd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:PEc4OjCaBwv8oOLzx9qtrV7V1uOwLqJnzxImxPsP1Bo="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:PEc4OjCaBwv8oOLzx9qtrV7V1uOwLqJnzxImxPsP1Bo="
  retries = 1
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-cd",
  ]

  sha     = "h1:PEc4OjCaBwv8oOLzx9qtrV7V1uOwLqJnzxImxPsP1Bo="
  retries = 0
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ae07c26a636fe3b5bb28d22a262e54d05ca464d96ef05afbd84a3d964f50a416"
  retries = 0
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha     = "h1:C+IcOQPZtt5b7kOJR87hRIVvo49JEM2/oTRopzumeEM="
  retries = 0
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha     = "h1:pmu+9A0i10sqSEMRsGhT8tZOEdW/0jUYW0WCBmCWXsA="
  retries = 1
}
