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

  sha = "9e23ca94f2ba031f0a5654b505ed3dc0d9740995496c0eedefae86f4fdea3eaf"
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

  sha = "h1:rfScPZg8ih1sYDNAvMrouhaS1APjId3qKeJ/EeU4PYs="
}
