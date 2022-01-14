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

  sha     = "1bb1fafde2b01f77b2beb9a75d87c80efbb21a30969c7d183690aeff7870bb8a"
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

  sha     = "h1:d89ntZ58EfInNmQFLnpMp9JvNzcCjeFXkrjkxEfNFkk="
  retries = 0
}
