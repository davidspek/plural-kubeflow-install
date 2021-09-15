metadata {
  path = "argo-workflows"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Jm6EvSaP2QeeCw5s/7F3xBBfIO4GI371mzOXjJ7/Smw="
}

step "terraform-apply" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Jm6EvSaP2QeeCw5s/7F3xBBfIO4GI371mzOXjJ7/Smw="
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

  sha = "h1:Jm6EvSaP2QeeCw5s/7F3xBBfIO4GI371mzOXjJ7/Smw="
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "2368340024be68d88b6831cfc883d5294a3690fdcb7ebf29e698fe82557e5ebb"
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

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
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

  sha = "h1:YPv/5Hl7WPVBhwsTZ7lBjrAwymQTm7OAQErRsM+1hOo="
}
