metadata {
  path = "redis"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
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

  sha     = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
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

  sha     = "e8941be73df045d6ea2531d54170d0b230343ce9a04a8e7ebbd85ae6b89a3d01"
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

  sha     = "h1:hB9EUtttC0PTmf9WyLVXHiYLAX2ov31G+XVeKooZpCA="
  retries = 0
}
