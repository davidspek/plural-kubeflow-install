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

  sha     = "4727dcb543891723b2dd8552aa845392af26a2b1456e18ea7f1ab4ad41fc29e3"
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

  sha     = "h1:/hKo7PEL29U7TGedTX3NDA/T4i+WCZUS2+UnMSL7ci0="
  retries = 0
}
