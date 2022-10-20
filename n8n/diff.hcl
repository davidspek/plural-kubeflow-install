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

  sha     = "e605d7aa5a0814a5d373d2e1aaeafc16997003917bda46f042d536c5299f3c1c"
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

  sha     = "h1:p65dW5bAMYNV0K+Pp5K15QFXnAcTlwFqjX6Sv1/cO/c="
  retries = 0
  verbose = false
}
