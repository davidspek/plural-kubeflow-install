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

  sha     = "h1:3aBhBXsxw00YHLHG338ujcnotxP9R02zQgIhnOjECV8="
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

  sha     = "h1:3aBhBXsxw00YHLHG338ujcnotxP9R02zQgIhnOjECV8="
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

  sha     = "h1:3aBhBXsxw00YHLHG338ujcnotxP9R02zQgIhnOjECV8="
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

  sha     = "fed7049ae44cec319f286a3066bb142dd47dfc00c1c2d4bdcab9656429361fea"
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
