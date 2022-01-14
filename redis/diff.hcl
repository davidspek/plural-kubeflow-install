metadata {
  path = "redis"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:XFOdPtbmQZ/B6ftfpIin1JAuRqnp1IYtHzmlnB2vi6g="
  retries = 0
}

step "terraform" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "redis",
  ]

  sha     = "h1:XFOdPtbmQZ/B6ftfpIin1JAuRqnp1IYtHzmlnB2vi6g="
  retries = 0
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "redis",
  ]

  sha     = "0a0e9c35af5e9d3d0a6b19bf4477dcfcc88bef64307b2f37f34e203857697546"
  retries = 0
}

step "helm" {
  wkdir   = "redis/helm"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "redis",
  ]

  sha     = "h1:su1QvpUO9izE7oBM+nbN2s7am+B03gSw8ileBpaQOhY="
  retries = 0
}
