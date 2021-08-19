metadata {
  path = "kafka"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:1NG90Moa9OkcZjgTb9IEafB7UmOxY19InfiCyPWyeHQ="
}

step "terraform-apply" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:1NG90Moa9OkcZjgTb9IEafB7UmOxY19InfiCyPWyeHQ="
}

step "terraform-output" {
  wkdir   = "kafka"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "d825ae46d7623d76fdf88deba956447fbf68d5669545d052633057ced77ba9df"
}

step "crds" {
  wkdir   = "kafka"
  target  = "kafka/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kafka",
  ]

  sha = "h1:R5aMMRvui09Sy/V4GIuS0McmqqdahbO1k7U/XsD6Zng="
}

step "bounce" {
  wkdir   = "kafka"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kafka",
  ]

  sha = "h1:MiwwYohXOHkbWQe8WMWXqoNOAs8f3Eoo2Pb+W7HX1t4="
}
