metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:F4u1mcs12/4EDMP44rK8mMKkpJjJunxv6D8PdCXxjsM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:F4u1mcs12/4EDMP44rK8mMKkpJjJunxv6D8PdCXxjsM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:F4u1mcs12/4EDMP44rK8mMKkpJjJunxv6D8PdCXxjsM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ceac959f92e62ef80404291a3810565815c61f5e86cbd036d9f45dd010474bdd"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:Y8Kvknohi3KI8I44uOu+cRzYrMDQGqkncr5bbnzbqIY="
  retries = 2
  verbose = false
}
