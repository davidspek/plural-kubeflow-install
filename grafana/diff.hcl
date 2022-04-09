metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:alUzGYmITVxb5gymfeRvxhUBq3cm635OsIYEqGXpwJQ="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:alUzGYmITVxb5gymfeRvxhUBq3cm635OsIYEqGXpwJQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "d5803eefd9848d1026866a260a57c6ded93eabc463a0d6ebaa144489df877e37"
  retries = 0
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:jzs4ufhxpt3OSw9XgV3hB8yNrkT8oDx0wTuxK4SxyDk="
  retries = 0
}
