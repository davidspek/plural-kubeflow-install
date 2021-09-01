metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Ofaj/ebRuJHYkP/8OH177+bd/V4mf3tAZmTDu+882aM="
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

  sha = "h1:Ofaj/ebRuJHYkP/8OH177+bd/V4mf3tAZmTDu+882aM="
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

  sha = "0d2c696a32369af5347a0b15ed683fcdd314ba9125a9d8bc3bfe1ae796f30f78"
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
