metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:MFoYpk1omrfue679WQe60Wwm3b5LLamIANF3q0iGe+0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-cd",
  ]

  sha     = "h1:MFoYpk1omrfue679WQe60Wwm3b5LLamIANF3q0iGe+0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-cd",
  ]

  sha     = "590a2a3411f84d94ed7fce4ae46294cf78eeb0e62ea4ab2f809452a45aa2ee21"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "argo-cd/helm"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-cd",
  ]

  sha     = "h1:SUjhDL8HfRVgg3IToF6+NirbRL5o/GY5hXQ6fz/8t7w="
  retries = 0
  verbose = false
}
