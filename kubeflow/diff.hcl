metadata {
  path = "kubeflow"
  name = "diff"
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

step "terraform" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "kubeflow",
  ]

  sha     = "d30b128a9b3eaf947dce90c16d17326fe877e872a84e87b81772628c1cd3a42e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubeflow/helm"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubeflow",
  ]

  sha     = "h1:XTzu5bpicUAKrrKjcrOTForVRPioFL/HMwdvTy/au4M="
  retries = 0
  verbose = false
}
