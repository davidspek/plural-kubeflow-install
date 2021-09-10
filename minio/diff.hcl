metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KS5ss5TjrQ8l+6g12GVR4mSC5749RIXgrpqFASqwSOg="
}

step "terraform" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "minio",
  ]

  sha = "h1:KS5ss5TjrQ8l+6g12GVR4mSC5749RIXgrpqFASqwSOg="
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "minio",
  ]

  sha = "d4f01b8a6eb7bbf07d459cf91884a1bcb5a48be8cd840870e7314c9cbd3b4a54"
}

step "helm" {
  wkdir   = "minio/helm"
  target  = "minio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "minio",
  ]

  sha = "h1:RXJLVaKlSbpqhXoy3ljX+qhmIfhHVwJEIeV42VQ9/tg="
}
