metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:KkWy5RToNM2/px/RMgDhfL/fVqM6hbEjVJbUYqvtCr4="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:KkWy5RToNM2/px/RMgDhfL/fVqM6hbEjVJbUYqvtCr4="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "28752f24a27614a3aa82f2ac5d526b2fcf3e2f48d8f7dd5f4321c199fb0fc680"
  retries = 0
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha     = "h1:u3tsDhe5kR1OfOt4ACe+4b9K35uqraq81X9wV5Pt5yY="
  retries = 0
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha     = "h1:WRNUCsmbxl37oIkNL3BHsc3x8Yq6pt9YblzVdcLevdk="
  retries = 1
}
