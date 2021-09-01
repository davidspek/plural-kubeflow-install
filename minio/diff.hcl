metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:/Z3gfZuQg5BVo7ll41Y+6lEp7Vvghet65TdTRb6Cras="
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

  sha = "h1:/Z3gfZuQg5BVo7ll41Y+6lEp7Vvghet65TdTRb6Cras="
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

  sha = "09b679cd5c5d9a3383d990f59a997b048e411a365be96efc244db688fb9de6c3"
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

  sha = "h1:Z3KrKMZJXqU7A9+y9yaQ+wJOGtN0dsvPmEE2B7GMWUk="
}
