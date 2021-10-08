metadata {
  path = "oauth2-proxy"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:QozGstgyqWdcdaCrupVzrRPz6KoDqKsMJtxk1okCfLY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:QozGstgyqWdcdaCrupVzrRPz6KoDqKsMJtxk1okCfLY="
  retries = 1
}

step "terraform-output" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "oauth2-proxy",
  ]

  sha     = "h1:QozGstgyqWdcdaCrupVzrRPz6KoDqKsMJtxk1okCfLY="
  retries = 0
}

step "kube-init" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "88e80d43ff26fd6f96cb3479b292615a7bba86e8548f940674f75dc04e431acd"
  retries = 0
}

step "crds" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "oauth2-proxy",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "oauth2-proxy",
  ]

  sha     = "h1:K9JXnZ8P7qoHz475baweyAlAq08ODffKLZixJlvlqlg="
  retries = 1
}
