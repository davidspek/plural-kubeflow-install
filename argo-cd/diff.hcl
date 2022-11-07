metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
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

  sha     = "35ec2276a92aab51b70c5fe5736759e234a0b8d7f6b886ddb24c18e15aa0b77c"
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

  sha     = "h1:L3u5qcEkD9DWRgsSm4Iu95oScfna4LM/aJVjbN6ef9w="
  retries = 0
  verbose = false
}
