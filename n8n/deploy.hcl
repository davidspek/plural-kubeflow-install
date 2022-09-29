metadata {
  path = "n8n"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:qQpqh/i1pjb7bn2s/sF5hd4ZLzn7Zvbkr+J44K28NWk="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:qQpqh/i1pjb7bn2s/sF5hd4ZLzn7Zvbkr+J44K28NWk="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "n8n"
  target  = "n8n/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "09c7d8f673ae88f6b17b701eeadacfa42630a922c1aa55977bec0b4bc60d71cc"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "n8n"
  target  = "n8n/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "n8n",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "n8n"
  target  = "n8n/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "n8n",
  ]

  sha     = "h1:C1414oEepIrz7ryySHM9uZx8ZfmrHcO3Cvh0JAOSwR4="
  retries = 2
  verbose = false
}
