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

  sha     = "850c7c5f71a95731501559be2b74838ded13c9ff94ddb9a5b850e9a915c6a7ab"
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

  sha     = "h1:1gisCMVSqMniZ6Jvhu3pJbgGgAwmcO5omJyfD7FP7so="
  retries = 0
  verbose = false
}
