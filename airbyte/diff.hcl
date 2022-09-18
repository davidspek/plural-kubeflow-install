metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:iZppMj0+ETPokoE9167OEsf1Yy7Ijs19MwjqJE6Q+sg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:iZppMj0+ETPokoE9167OEsf1Yy7Ijs19MwjqJE6Q+sg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "d951db27020cf2e7c9659fae6b4a47aa626b958e4b30e5b326d6c73945fc77f9"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:0Js+3Jp9H0vk02VDT2YD1VNP3y6tJKyMF3t6ze+7ULA="
  retries = 0
  verbose = false
}
