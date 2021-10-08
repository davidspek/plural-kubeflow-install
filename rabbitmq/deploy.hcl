metadata {
  path = "rabbitmq"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:cUQzE7o9ngyBMevLSVxrBYBp5yzplJH8aV9WBZAytqk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:cUQzE7o9ngyBMevLSVxrBYBp5yzplJH8aV9WBZAytqk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "rabbitmq",
  ]

  sha     = "h1:cUQzE7o9ngyBMevLSVxrBYBp5yzplJH8aV9WBZAytqk="
  retries = 0
}

step "kube-init" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "f45a728e2b9b6b4162234e8a2b6570cf566f2c413b6573d5cffa7b0e25dbdbb4"
  retries = 0
}

step "crds" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "rabbitmq",
  ]

  sha     = "h1:f4Cb0NOWBtMWNFjY+kSmO2DoPMYzZBoowo0fCVE1hwo="
  retries = 0
}

step "bounce" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "rabbitmq",
  ]

  sha     = "h1:jNZhHYk0HOGZkahO/9cxxI9CpiSoXePjTJIQtlsrppY="
  retries = 0
}
