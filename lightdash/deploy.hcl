metadata {
  path = "lightdash"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "lightdash"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "lightdash",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "lightdash"
  target  = "lightdash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1ba45efc4ed857f795a2a53fec13781d77b029c04d5dbf48bf7c3bc7f49740bf"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "lightdash"
  target  = "lightdash/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "lightdash",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "lightdash"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "lightdash",
  ]

  sha     = "h1://A/uPmpNnplAIfs0gE8tRMajpvOqKOQBWh7uRYCUPI="
  retries = 2
  verbose = false
}
