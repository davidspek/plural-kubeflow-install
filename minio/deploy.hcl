metadata {
  path = "minio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:B5OsjN4dDFCx0KZp+WAFXZuZiRgPBBZh4yv9aLGpOJI="
}

step "terraform-apply" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:B5OsjN4dDFCx0KZp+WAFXZuZiRgPBBZh4yv9aLGpOJI="
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

  sha = "h1:B5OsjN4dDFCx0KZp+WAFXZuZiRgPBBZh4yv9aLGpOJI="
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "465bf8f43e488b3801b5b3bb97f52dc2d62b9f0b3f27dcbeb2c1dd228f3ca561"
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

  sha = "h1:/h29nytUuaaUVaKZpXkQOHsN3K5aJ5wi4d08xHc6JMk="
}
