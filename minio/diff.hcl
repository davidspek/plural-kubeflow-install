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

  sha = "545f49ffed46c615d06f3307291def2df5b0f9ea3d51c6dfd938a381b9f4d780"
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

  sha = "h1:Ym12nDD/HWqzLVmG19HD+zWJz9r3qwDpxBvtLTFlMIs="
}
