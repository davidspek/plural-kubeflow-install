metadata {
  path = "rabbitmq"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
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

  sha = ""
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

  sha = ""
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

  sha = ""
}
