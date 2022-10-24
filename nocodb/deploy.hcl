metadata {
  path = "nocodb"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "nocodb"
  target  = "nocodb/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nocodb",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nocodb"
  target  = "nocodb/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "01ae7a32722ecb06bb9aa0fa9be48e07a78fd65d27e99ff3499264076e85551f"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "nocodb"
  target  = "nocodb/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nocodb",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "nocodb"
  target  = "nocodb/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nocodb",
  ]

  sha     = "h1:CIrW2TlEPnyUy7FpbZbDJmtHB+lnL14b8KYMOKNeddY="
  retries = 2
  verbose = false
}
