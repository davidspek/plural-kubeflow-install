metadata {
  path = "argo-workflows"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E04Q4oFciyJheFgYXiZYOHc9krxHEhG4AXkv4rqVbeM="
  retries = 0
}

step "terraform" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-workflows",
  ]

  sha     = "h1:E04Q4oFciyJheFgYXiZYOHc9krxHEhG4AXkv4rqVbeM="
  retries = 0
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-workflows",
  ]

  sha     = "5acad22e58610323697ce2b41efe6dd2d77ac0f900b5e49d9473e77a6dc6c9c8"
  retries = 0
}

step "helm" {
  wkdir   = "argo-workflows/helm"
  target  = "argo-workflows/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-workflows",
  ]

  sha     = "h1:YPv/5Hl7WPVBhwsTZ7lBjrAwymQTm7OAQErRsM+1hOo="
  retries = 0
}
