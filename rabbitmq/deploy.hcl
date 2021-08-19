metadata {
  path = "rabbitmq"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:/hzWKGZKS0Aao+D5UvqBHKkNkNHm9fIpWiMWBTKPAQs="
}

step "terraform-apply" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:/hzWKGZKS0Aao+D5UvqBHKkNkNHm9fIpWiMWBTKPAQs="
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

  sha = "h1:/hzWKGZKS0Aao+D5UvqBHKkNkNHm9fIpWiMWBTKPAQs="
}

step "kube-init" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "a502dbed28833c04e0b96aa5b5d4be581f1f039b039da3ce7fccb5c4dc27c46b"
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

  sha = "h1:f4Cb0NOWBtMWNFjY+kSmO2DoPMYzZBoowo0fCVE1hwo="
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

  sha = "h1:ruQmIIyTBvaAm47kuuTc1ZDmXLBBGvgndNZSpWEm+N8="
}
