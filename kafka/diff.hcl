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

  sha = "d825ae46d7623d76fdf88deba956447fbf68d5669545d052633057ced77ba9df"
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

  sha = "h1:MiwwYohXOHkbWQe8WMWXqoNOAs8f3Eoo2Pb+W7HX1t4="
}
