metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
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

  sha = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "e8941be73df045d6ea2531d54170d0b230343ce9a04a8e7ebbd85ae6b89a3d01"
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

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
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

  sha = "h1:hB9EUtttC0PTmf9WyLVXHiYLAX2ov31G+XVeKooZpCA="
}
