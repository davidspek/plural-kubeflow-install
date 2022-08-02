metadata {
  path = "n8n"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OyvNVSkD3j1d5DpR10+IbzUxGj+AdHqmnLQhQUf6ZT8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "n8n",
  ]

  sha     = "h1:OyvNVSkD3j1d5DpR10+IbzUxGj+AdHqmnLQhQUf6ZT8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "n8n"
  target  = "n8n/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "n8n",
  ]

  sha     = "2f00dd561bea9c2f64c252a39329cb5e938f4b60425ca2b84a94494487f226e0"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "n8n/helm"
  target  = "n8n/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "n8n",
  ]

  sha     = "h1:P7tzX/+PuSqiNQnN0PW2tjrBzHC4vtO0j57mZ97amEE="
  retries = 0
  verbose = false
}
