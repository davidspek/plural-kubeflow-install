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

  sha     = "8082ffb2401563f226c2924395cf122ba0e34a73ca89efc89b31356cf51e51a8"
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
