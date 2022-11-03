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

  sha     = "1c1c3d994353aebd644977ad39c4fd47989687bd42670640cd8dc26ce7099ae6"
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

  sha     = "h1:1Z57Ft2OmIg1xH3fbFKk41VAkF1KThZWdoU99q1LA+k="
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

  sha     = "h1:OsLbiWCYrNePwi0TBrtVyzDapX4bVl8gDla96Pipcd0="
  retries = 2
  verbose = false
}
