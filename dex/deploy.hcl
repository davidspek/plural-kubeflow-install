metadata {
  path = "dex"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pUaiy0XnraZvtZtwqbPeQqyOVzxZKGm65oAS9kAjRXk="
}

step "terraform-apply" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:pUaiy0XnraZvtZtwqbPeQqyOVzxZKGm65oAS9kAjRXk="
}

step "terraform-output" {
  wkdir   = "dex"
  target  = "dex/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "dex",
  ]

  sha = "h1:pUaiy0XnraZvtZtwqbPeQqyOVzxZKGm65oAS9kAjRXk="
}

step "kube-init" {
  wkdir   = "dex"
  target  = "dex/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dex",
  ]

  sha = "e53b2d4ef753d712b280b5e29a42ea9dfbee43d258d3e9996460ddad4ea5aca6"
}

step "crds" {
  wkdir   = "dex"
  target  = "dex/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "dex",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "dex"
  target  = "dex/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "dex",
  ]

  sha = ""
}
