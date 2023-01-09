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

  sha     = "h1:n1Br7C2z0w6RIX13k54nsqV/FH+zlDAnWxtJXsiofF4="
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

  sha     = "h1:n1Br7C2z0w6RIX13k54nsqV/FH+zlDAnWxtJXsiofF4="
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

  sha     = "h1:n1Br7C2z0w6RIX13k54nsqV/FH+zlDAnWxtJXsiofF4="
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

  sha     = "d30b128a9b3eaf947dce90c16d17326fe877e872a84e87b81772628c1cd3a42e"
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

  sha     = "h1:XTzu5bpicUAKrrKjcrOTForVRPioFL/HMwdvTy/au4M="
  retries = 2
  verbose = false
}
