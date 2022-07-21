metadata {
  path = "n8n"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
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

  sha     = ""
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

  sha     = ""
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

  sha     = ""
  retries = 0
  verbose = false
}
