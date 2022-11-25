metadata {
  path = "strapi"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "strapi",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "strapi"
  target  = "strapi/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "strapi",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "strapi/helm"
  target  = "strapi/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "strapi",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
