metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:CRXRgXjf1Qe6WO79LW3y1OJMKFykw4hdH7EYSP1qgRo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:CRXRgXjf1Qe6WO79LW3y1OJMKFykw4hdH7EYSP1qgRo="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "kubeflow"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubeflow",
  ]

  sha     = "h1:CRXRgXjf1Qe6WO79LW3y1OJMKFykw4hdH7EYSP1qgRo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "49827e00f11b712799e3015cd64446293077ff376ac5acc70d7ada2ddeda72cc"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kubeflow"
  target  = "kubeflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubeflow",
  ]

  sha     = "h1:ernDEodaSxweBIpMzHrWPMJ5+cW8AZ8x3CUOd3QkZkk="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kubeflow"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubeflow",
  ]

  sha     = "h1:Zil8Wgf2n3PgQaZ3VK3V7/hC5ByJWqBdCWIbiwnAbGs="
  retries = 2
  verbose = false
}
