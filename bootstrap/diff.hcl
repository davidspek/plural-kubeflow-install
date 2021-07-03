metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ma2G81gjC+4/Q9mF4FpYCc8eBryZjNFPEGoXwHirXUY="
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

  sha = "h1:ma2G81gjC+4/Q9mF4FpYCc8eBryZjNFPEGoXwHirXUY="
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

  sha = "adef25c159a70f63da4ad9de6d0c76bb1a3874d2fdb46e11e90b67392dba0662"
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

  sha = "h1:9wIJ+2im7KIfI9+z5tDe+7dyf7ORibnixTywbptwxiA="
}
