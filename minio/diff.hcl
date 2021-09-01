metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:PB8BhtgtslevbBUDZg5+8ALaWzJjR3fbLbh0z/2Xi3w="
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

  sha = "h1:PB8BhtgtslevbBUDZg5+8ALaWzJjR3fbLbh0z/2Xi3w="
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

  sha = "a3c16f2ceced90cc97182fec9da46563c17f8b8f21b374f61bebddedf3f99aa6"
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
