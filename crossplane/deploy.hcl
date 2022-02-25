metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:6WkdMsNb4UXJdfb9Gap0NSiDNx73zE+Qd1l7F/MsCKU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:6WkdMsNb4UXJdfb9Gap0NSiDNx73zE+Qd1l7F/MsCKU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "crossplane",
  ]

  sha     = "h1:6WkdMsNb4UXJdfb9Gap0NSiDNx73zE+Qd1l7F/MsCKU="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "c12e756036d5950b423f5bb1efeff90f3f338a72b93b7e76820af7596dd267c4"
  retries = 0
}

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha     = "h1:CU0hEbDPeNZ/2yYbzx5DY3hegKDYiNW1nlhpsiNQT3E="
  retries = 0
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha     = "h1:SresmnzWF73bqNpwTKHdMJo/MO7nnswLhpqLFr7bo8M="
  retries = 1
}
