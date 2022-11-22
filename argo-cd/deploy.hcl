metadata {
  path = "argo-cd"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:MFoYpk1omrfue679WQe60Wwm3b5LLamIANF3q0iGe+0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "c79cc95c6e15112462d52fb6055b6d0706557367ef88d928a7d8ac16d81ea943"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha     = "h1:va6snQaY+PXdygN7PnzCcpnVFft//7z9hJcC/iPBb74="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha     = "h1:93Qy2k96SNByFgsEtd3fH5ZeqFjMd56/KCVF1ANJMnw="
  retries = 2
  verbose = false
}
