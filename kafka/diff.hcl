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

  sha = "ffce9306a186cbc7884da4054b1703b26b1b28d2405cee591c346860292aef5a"
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

  sha = "h1:B3cRJ5c6WllmiQ5NMf9z8oLy6LZ2ESE9cS04D4ojNn8="
}
