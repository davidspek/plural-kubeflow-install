metadata {
  path = "nextcloud"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:mMOK1CQzbn07qpycySv2zMMkNIEANzXPD/GUuEC/sGE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:mMOK1CQzbn07qpycySv2zMMkNIEANzXPD/GUuEC/sGE="
  retries = 2
  verbose = false
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

  sha     = "h1:mMOK1CQzbn07qpycySv2zMMkNIEANzXPD/GUuEC/sGE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nextcloud"
  target  = "nextcloud/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8260cd17279a96912d4ba6daefaa9c04098b19723428c53a054263bffea96612"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:stBqSpJX4pVRyhIouJZnR/op+Ck2uVTmkKu3MkzAzEM="
  retries = 2
  verbose = false
}
