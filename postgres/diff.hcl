metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:QNL4jfBQcqNr7p5l9vB16/q6QjMUrp6cXqc2TVzllR0="
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha = "h1:QNL4jfBQcqNr7p5l9vB16/q6QjMUrp6cXqc2TVzllR0="
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha = "7c1460ac1c304f04c2ab1108615b8a5bda7b7bbe599847cff423749cb8198f53"
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha = "h1:4uZntiYHcBU39AGoLqBTyBIiQhusgT7hd43+m5yScT4="
}
