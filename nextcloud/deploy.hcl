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

  sha     = "h1:K8BCC8kzTAbl0kEawc+uYDofdpmzS2W8PKQtDWe/KuU="
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

  sha     = "h1:K8BCC8kzTAbl0kEawc+uYDofdpmzS2W8PKQtDWe/KuU="
  retries = 1
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

  sha     = "h1:K8BCC8kzTAbl0kEawc+uYDofdpmzS2W8PKQtDWe/KuU="
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

  sha     = "ce8df059df65878a4667635a70e614f25e760d83be765789cd3c03788029c646"
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

  sha     = "h1:AhdkcnKAtjgpRzk+Z9GkKUOTaQtHsSTmH/N5xY0AOu4="
  retries = 1
  verbose = false
}
