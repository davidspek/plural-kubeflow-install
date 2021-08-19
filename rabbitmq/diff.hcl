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

  sha = "b72b404f969f72e75dad84af6d4182cc102c6b8dd7122af05e2c31785de3b46f"
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
