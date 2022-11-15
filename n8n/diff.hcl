metadata {
  path = "n8n"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:qQpqh/i1pjb7bn2s/sF5hd4ZLzn7Zvbkr+J44K28NWk="
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

  sha     = "h1:qQpqh/i1pjb7bn2s/sF5hd4ZLzn7Zvbkr+J44K28NWk="
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

  sha     = "6555a6e5e14893486bb7d9e78bce5778749ff410a5df3d41470bbed49f0029b5"
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

  sha     = "h1:i0Jhqot2+WJGpjywaI+YculNkNzq84SUQ3wxmS4tLkc="
  retries = 0
  verbose = false
}
