metadata {
  path = "nextcloud"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Gtwc9k32ifaq7qZdmD5i/hT147zBQS++mFeUCd2nHQw="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Gtwc9k32ifaq7qZdmD5i/hT147zBQS++mFeUCd2nHQw="
  retries = 1
}

step "terraform-output" {
  wkdir   = "nextcloud"
  target  = "nextcloud/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nextcloud",
  ]

  sha     = "h1:Gtwc9k32ifaq7qZdmD5i/hT147zBQS++mFeUCd2nHQw="
  retries = 0
}

step "kube-init" {
  wkdir   = "nextcloud"
  target  = "nextcloud/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7a74a206db25adc7a5e120e49f1789c92a9edab8d88fded716663e40261bcc55"
  retries = 0
}

step "crds" {
  wkdir   = "nextcloud"
  target  = "nextcloud/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nextcloud",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "nextcloud"
  target  = "nextcloud/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nextcloud",
  ]

  sha     = "h1:jLB5bMX2q90MNzwERzpQvLKSfAmF2lCbgZAgzzUB5Cs="
  retries = 0
}
