metadata {
  path = "kafka"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:1NG90Moa9OkcZjgTb9IEafB7UmOxY19InfiCyPWyeHQ="
}

step "terraform" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kafka",
  ]

  sha = "h1:1NG90Moa9OkcZjgTb9IEafB7UmOxY19InfiCyPWyeHQ="
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kafka",
  ]

  sha = "dca2a233ce891b2081cc76bfe2dc0cf0907c836708d51c49ad81e27d61e6c11c"
}

step "helm" {
  wkdir   = "kafka/helm"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kafka",
  ]

  sha = "h1:rlE1Menvpn+T4GPDxCs/9j0FE0ZuXvPLFkt6A1LiAgs="
}
