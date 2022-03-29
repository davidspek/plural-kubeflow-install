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

  sha     = "59e0870708dcddecc4d8f538d2146052c0f43070eda9e58d0c921c30b87f4f5a"
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

  sha     = "h1:vXv4yvaaxbjmd+hOpluKyZjoxsLzu36zoMgrZaKGnXE="
  retries = 0
}
