metadata {
  path = "renovate"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 0
}

step "terraform" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "renovate",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 0
}

step "kube-init" {
  wkdir   = "renovate"
  target  = "renovate/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "renovate",
  ]

  sha     = "3605302073602833d0fe702f5fbc0b210a4c843030552b3688253b2e1e4cc0b4"
  retries = 0
}

step "helm" {
  wkdir   = "renovate/helm"
  target  = "renovate/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "renovate",
  ]

  sha     = "h1:ApyNIu00NPzoMrlP+4av6/zCCyv6OouIKcrwPEsi/50="
  retries = 0
}
