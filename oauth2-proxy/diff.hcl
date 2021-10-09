metadata {
  path = "oauth2-proxy"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:QozGstgyqWdcdaCrupVzrRPz6KoDqKsMJtxk1okCfLY="
  retries = 0
}

step "terraform" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "oauth2-proxy",
  ]

  sha     = "91a6abe0e52c7d0a1bdc0273aa42922f7b5326ab7c910989507ef4f067681645"
  retries = 0
}

step "helm" {
  wkdir   = "oauth2-proxy/helm"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oauth2-proxy",
  ]

  sha     = "h1:K9JXnZ8P7qoHz475baweyAlAq08ODffKLZixJlvlqlg="
  retries = 0
}
