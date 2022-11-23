metadata {
  path = "dagster"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "dagster",
  ]

  sha     = "c5a75ae432321f006d637474679a50ca99f6829ff08c591234a4b45108a50b68"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "dagster/helm"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dagster",
  ]

  sha     = "h1:d7XJ4aMRCU9yvfH1or3mGhXMuaAiHOGwD2llSEtRmxA="
  retries = 0
  verbose = false
}
