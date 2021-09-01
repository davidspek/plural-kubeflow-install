metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:+xpCBE6/byVzn+i7XLi6DH64EIRQ85pmVzSYdrlbgBU="
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

  sha = "h1:+xpCBE6/byVzn+i7XLi6DH64EIRQ85pmVzSYdrlbgBU="
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

  sha = "782dbd0051c04a063d63fa59f61030b43f6ff1110b4aa3c6cf5cfc1939809cc2"
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

  sha = "h1:misOftvowQz9pC+nIvQFJ4INn3yqdQBCs5P7HPc/eys="
}
