metadata {
  path = "dagster"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "dagster"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "dagster",
  ]

  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "dagster"
  target  = "dagster/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "86a448aa62b57786dff1d24b060932b68b5b88f1b758314671594e2fcc277e10"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "dagster"
  target  = "dagster/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "dagster",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "dagster"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "dagster",
  ]

  sha     = "h1:l2Koj78uq/CRJM57veXOQB/vzV02da6P2M/4wR9AdDM="
  retries = 2
  verbose = false
}
