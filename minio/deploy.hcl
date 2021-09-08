metadata {
  path = "minio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KS5ss5TjrQ8l+6g12GVR4mSC5749RIXgrpqFASqwSOg="
}

step "terraform-apply" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:KS5ss5TjrQ8l+6g12GVR4mSC5749RIXgrpqFASqwSOg="
}

step "terraform-output" {
  wkdir   = "minio"
  target  = "minio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "545f49ffed46c615d06f3307291def2df5b0f9ea3d51c6dfd938a381b9f4d780"
}

step "crds" {
  wkdir   = "minio"
  target  = "minio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "minio",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "minio"
  target  = "minio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "minio",
  ]

  sha = "h1:Ym12nDD/HWqzLVmG19HD+zWJz9r3qwDpxBvtLTFlMIs="
}
