metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:B5OsjN4dDFCx0KZp+WAFXZuZiRgPBBZh4yv9aLGpOJI="
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

  sha = "h1:B5OsjN4dDFCx0KZp+WAFXZuZiRgPBBZh4yv9aLGpOJI="
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

  sha = "5b9d13c1812436314bc6309139d1e7b29c88462d33ae7a155746a5cb947fa41a"
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

  sha = "h1:/h29nytUuaaUVaKZpXkQOHsN3K5aJ5wi4d08xHc6JMk="
}
