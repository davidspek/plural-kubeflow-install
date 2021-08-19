metadata {
  path = "rabbitmq"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:/hzWKGZKS0Aao+D5UvqBHKkNkNHm9fIpWiMWBTKPAQs="
}

step "terraform" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "rabbitmq",
  ]

  sha = "a502dbed28833c04e0b96aa5b5d4be581f1f039b039da3ce7fccb5c4dc27c46b"
}

step "helm" {
  wkdir   = "rabbitmq/helm"
  target  = "rabbitmq/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "rabbitmq",
  ]

  sha = "h1:ruQmIIyTBvaAm47kuuTc1ZDmXLBBGvgndNZSpWEm+N8="
}
