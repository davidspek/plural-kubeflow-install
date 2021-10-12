metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:JMFc6s99GTtLBakOO6hcPiBVPg+KkrboCSi+F3ytaeM="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:JMFc6s99GTtLBakOO6hcPiBVPg+KkrboCSi+F3ytaeM="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "332ecf104ec31fb2bc2d5506a9ab79bc6461bb6d663d22d44520a3320b81f1df"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:3wTQ2ZmMgkq3hB2Bm+FyYl4Bt21bAqBK9HNGOcKmVjE="
  retries = 0
}
