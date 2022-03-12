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

  sha     = "2f3dff2f1fd4742ee111d3f20ca3ef9c083e7e3d2d9f6071c824ed161fc38b00"
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

  sha     = "h1:rThnaD9Rk8pG2Yy/ofYGLWxpsubwbjykQlLioxQIuLg="
  retries = 0
}
