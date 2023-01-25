metadata {
  path = "prefect"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:sZ3CkCCZfUE42iFZ3xKRF/q8oszxBYEctaRK6+TITIY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:sZ3CkCCZfUE42iFZ3xKRF/q8oszxBYEctaRK6+TITIY="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "prefect"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "prefect",
  ]

  sha     = "h1:sZ3CkCCZfUE42iFZ3xKRF/q8oszxBYEctaRK6+TITIY="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "prefect"
  target  = "prefect/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6ee99ff70c94595ec7f46a7fad5211fb4c35e0a6c5cc30e8a9ab353f61b11a54"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "prefect"
  target  = "prefect/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "prefect",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "prefect"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "prefect",
  ]

  sha     = "h1:Z4rZOWt0NNzOzi5awu0VZuEo+PC3ygdZp9J3W1e/LQ4="
  retries = 2
  verbose = false
}
