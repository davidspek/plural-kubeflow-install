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

  sha = "b8e51351bc20de1def2f7c850b4e04963647867a80d4d5062a9ee80dde8cf5bc"
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

  sha = "h1:1HelRgESGcJ1eyGpsj7SbDx+/k43/GcoKFE3zZXkq8M="
}
