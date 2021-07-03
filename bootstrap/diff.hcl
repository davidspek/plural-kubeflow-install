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

  sha = "d0a099d13ea0787ce7fa94206c6ea5ece9bf9e32abc2bccf0a33112585d485ca"
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

  sha = "h1:rO/VOwXB4E6nCcuq5x/Ijg57B8XWzdMoWwfI6PCr5mY="
}
