metadata {
  path = "strapi"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:kI+49/WYtN9QfYF6vmxr6949Q/3Vq8UbgvzGjZyIty0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:kI+49/WYtN9QfYF6vmxr6949Q/3Vq8UbgvzGjZyIty0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "strapi"
  target  = "strapi/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "strapi",
  ]

  sha     = "h1:kI+49/WYtN9QfYF6vmxr6949Q/3Vq8UbgvzGjZyIty0="
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
  ]

  sha     = "d295415b410e465f975975ca30d4e85970e88f63efdeea09d595485b95ab6458"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "strapi"
  target  = "strapi/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "strapi",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "strapi"
  target  = "strapi/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "strapi",
  ]

  sha     = "h1:vKgnQZ2iruzYDyXDMX3lzu6hwboO4q52djsE2mFU0H8="
  retries = 2
  verbose = false
}
