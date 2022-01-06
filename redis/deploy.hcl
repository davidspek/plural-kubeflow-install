metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:XFOdPtbmQZ/B6ftfpIin1JAuRqnp1IYtHzmlnB2vi6g="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:XFOdPtbmQZ/B6ftfpIin1JAuRqnp1IYtHzmlnB2vi6g="
  retries = 1
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "742b734acb4e7f55d55ea5980e99fe5460348003d2451257a2761bd98dd6042c"
  retries = 0
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha     = "h1:SNQ1FLnm9UJdPo5TpoDKgrLnZRLq4MSMFY5CKxJh42s="
  retries = 1
}
