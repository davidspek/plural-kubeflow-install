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

  sha     = "h1:QAp3kF1O1Em/O3G808+1dn7NvfraeOXs2ABPJtmRDc4="
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

  sha     = "h1:QAp3kF1O1Em/O3G808+1dn7NvfraeOXs2ABPJtmRDc4="
  retries = 2
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

  sha     = "h1:QAp3kF1O1Em/O3G808+1dn7NvfraeOXs2ABPJtmRDc4="
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

  sha     = "1ba2b433e8cffc386044724c4899fa734091a621c5b956b0e2630d2f6e71213e"
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

  sha     = "h1:gN2rEppPdolyAdkBn4Sh+dRW7/J043HjNSrQ+7/oeOw="
  retries = 2
  verbose = false
}
