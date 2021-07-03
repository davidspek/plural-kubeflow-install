metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ma2G81gjC+4/Q9mF4FpYCc8eBryZjNFPEGoXwHirXUY="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:ma2G81gjC+4/Q9mF4FpYCc8eBryZjNFPEGoXwHirXUY="
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

  sha = "7021651f049a1858611315c6e114dc4543ac288f1cf4012e6f018533c4dc0744"
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

  sha = "h1:2N/91vLdoqf+BuROXb2HJ7HIKH/lkoqIn6vT3f2/a2Q="
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

  sha = "h1:be2yeziKGbobcUsvkLiHkhMf/6L34j8ONGvcv9jn8cc="
}
