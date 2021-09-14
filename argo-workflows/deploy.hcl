metadata {
  path = "argo-workflows"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:1mtwyqNMocsf3UHPrbU4nfAjXPnW1rFDA4uBpQ7jMdU="
}

step "terraform-apply" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:1mtwyqNMocsf3UHPrbU4nfAjXPnW1rFDA4uBpQ7jMdU="
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

  sha = "h1:1mtwyqNMocsf3UHPrbU4nfAjXPnW1rFDA4uBpQ7jMdU="
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "35e84c56ff5444c0532ea3b08a56080a65b511130ee1cfbf47446272149c7f29"
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

  sha = "h1:T7BHvuDeATvL/o2H7G8/M/EnO5wR+eBirrzLibD6MXI="
}
