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

  sha = "1a41394ac60f9deb0afdbaaab6403cf122af8a29203991e8c4e35ba4c3202a53"
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
