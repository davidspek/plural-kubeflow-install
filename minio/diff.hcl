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

  sha = "344f8307e55e1dea42b3cb6de0ea060698c6a4331543c19bb0343bad2ccf0eb5"
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
