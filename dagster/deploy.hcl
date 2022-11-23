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

  sha     = "c5a75ae432321f006d637474679a50ca99f6829ff08c591234a4b45108a50b68"
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

  sha     = "h1:d7XJ4aMRCU9yvfH1or3mGhXMuaAiHOGwD2llSEtRmxA="
  retries = 2
  verbose = false
}
