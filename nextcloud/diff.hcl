metadata {
  path = "nextcloud"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:VwkRSmWvxz3ABUQ223UW/pDI+i1AP51rsJxIpJRZDro="
}

step "terraform" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "nextcloud",
  ]

  sha = "b8e51351bc20de1def2f7c850b4e04963647867a80d4d5062a9ee80dde8cf5bc"
}

step "helm" {
  wkdir   = "nextcloud/helm"
  target  = "nextcloud/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nextcloud",
  ]

  sha = "h1:1HelRgESGcJ1eyGpsj7SbDx+/k43/GcoKFE3zZXkq8M="
}
