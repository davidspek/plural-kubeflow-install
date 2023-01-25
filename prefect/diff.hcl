metadata {
  path = "prefect"
  name = "diff"
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

step "terraform" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "prefect",
  ]

  sha     = "6ee99ff70c94595ec7f46a7fad5211fb4c35e0a6c5cc30e8a9ab353f61b11a54"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "prefect/helm"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "prefect",
  ]

  sha     = "h1:Z4rZOWt0NNzOzi5awu0VZuEo+PC3ygdZp9J3W1e/LQ4="
  retries = 0
  verbose = false
}
