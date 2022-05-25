metadata {
  path = "rabbitmq"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Oa/LpNhrUCwGkRwCb1QQiziGEQsukqRsroM/m2hy4dM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Oa/LpNhrUCwGkRwCb1QQiziGEQsukqRsroM/m2hy4dM="
  retries = 1
  verbose = false
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

  sha     = "h1:Oa/LpNhrUCwGkRwCb1QQiziGEQsukqRsroM/m2hy4dM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6cdd6652a9a457dd3066ac2a9d84bf021462763c36fe45d1c63cb1b30a143f0a"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:NeNBYpPOEderBDRiwrRtdI7yk7r+aiUmxgYuUO8LAuM="
  retries = 1
  verbose = false
}
