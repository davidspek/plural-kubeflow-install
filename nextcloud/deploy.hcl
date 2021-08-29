metadata {
  path = "nextcloud"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:VwkRSmWvxz3ABUQ223UW/pDI+i1AP51rsJxIpJRZDro="
}

step "terraform-apply" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:VwkRSmWvxz3ABUQ223UW/pDI+i1AP51rsJxIpJRZDro="
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

  sha = "h1:VwkRSmWvxz3ABUQ223UW/pDI+i1AP51rsJxIpJRZDro="
}

step "kube-init" {
  wkdir   = "nextcloud"
  target  = "nextcloud/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "2321f36aa305e18ee9a0ae7c90226d60c5a937a12993db015617fbdf62526b90"
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

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
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

  sha = "h1:V8AREmBWupwU2HkuGGWLl32u8/iJhHVbgT4onygFGrM="
}
