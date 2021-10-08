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
  retries = 0
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

  sha     = "h1:VwkRSmWvxz3ABUQ223UW/pDI+i1AP51rsJxIpJRZDro="
  retries = 0
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

  sha     = "8982eaac9517d66c33b820ce6c0f15bcd291c785801819425ad11690671066e5"
  retries = 0
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

  sha     = "h1:MN9ZOxpPnp7g5wDenX/heJlsTiF1KEaUqN+WQHgNE5E="
  retries = 0
}
