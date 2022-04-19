metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KkWy5RToNM2/px/RMgDhfL/fVqM6hbEjVJbUYqvtCr4="
  retries = 0
}

step "terraform" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mysql",
  ]

  sha     = "h1:KkWy5RToNM2/px/RMgDhfL/fVqM6hbEjVJbUYqvtCr4="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha     = "d5fd93dae3cb3af0fb7c29f38fef9cc01046e6b966e73bbca70b537733cf42d7"
  retries = 0
}

step "helm" {
  wkdir   = "mysql/helm"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mysql",
  ]

  sha     = "h1:WRNUCsmbxl37oIkNL3BHsc3x8Yq6pt9YblzVdcLevdk="
  retries = 0
}
