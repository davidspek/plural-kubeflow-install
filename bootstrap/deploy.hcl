metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7b3upjvR1GKC22IOYJ3xNqdpCEnFJQfw79FTcwBOIzE="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:7b3upjvR1GKC22IOYJ3xNqdpCEnFJQfw79FTcwBOIzE="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:7b3upjvR1GKC22IOYJ3xNqdpCEnFJQfw79FTcwBOIzE="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "4918b060f305b2e914ee4ca72c4d0f8881e5af13c6d5674d2bcca5208fb95de2"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:7FdY7EQzLud8Ibr90WeuMDc/WYeGqxdvj85wM+8PEBU="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:IWd6W8b30jdztS5OUePKD3qRn7qpJMvnp92WATL2mB4="
}
