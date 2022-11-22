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

  sha     = "c79cc95c6e15112462d52fb6055b6d0706557367ef88d928a7d8ac16d81ea943"
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

  sha     = "h1:93Qy2k96SNByFgsEtd3fH5ZeqFjMd56/KCVF1ANJMnw="
  retries = 0
  verbose = false
}
