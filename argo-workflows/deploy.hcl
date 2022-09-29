metadata {
  path = "argo-workflows"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:M+0Qp97YDakbcnWfU3Utfh6/EiOEwWXCnEPFvSI8etc="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:M+0Qp97YDakbcnWfU3Utfh6/EiOEwWXCnEPFvSI8etc="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-workflows",
  ]

  sha     = "h1:M+0Qp97YDakbcnWfU3Utfh6/EiOEwWXCnEPFvSI8etc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0735bfce9b464d696cfbb4d6af343a67e38b0d2a9f0495ab97be1e1d15be34ba"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-workflows",
  ]

  sha     = "h1:FtyHzEhEaLNLDGcU3J4DqEZCT0/LCYPvyf/Vg0VjyoE="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-workflows",
  ]

  sha     = "h1:NaLGMZGAD2X22zugMX6TMz8U48S6GI7ibtVRFYHvaQ4="
  retries = 2
  verbose = false
}
