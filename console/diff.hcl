metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "cd0942006b248b57f5880cc67005d8b3150f4e967b7b7e4911f42645c5019f41"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:SFUQq4pzBc/P1Su2Tisd4Rf2+QRb1EueS0mWRuLUInY="
  retries = 0
}
