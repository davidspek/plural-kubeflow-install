metadata {
  path = "lightdash"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "lightdash",
  ]

  sha     = "1ba45efc4ed857f795a2a53fec13781d77b029c04d5dbf48bf7c3bc7f49740bf"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "lightdash/helm"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "lightdash",
  ]

  sha     = "h1://A/uPmpNnplAIfs0gE8tRMajpvOqKOQBWh7uRYCUPI="
  retries = 0
  verbose = false
}
