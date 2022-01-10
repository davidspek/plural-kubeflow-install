metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "2d8fc0f7d356dcd837eda99b23b39d4cc2f54c45423039c15cabd7bec1e34716"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:jHmr6e1TOalOaedVYn8sUXgHNUlcRevl1CbMePAKq7w="
  retries = 0
}
