metadata {
  path = "renovate"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 1
}

step "terraform-output" {
  wkdir   = "renovate"
  target  = "renovate/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "327e9742f90fc9efe8625bab838c58ebe0ca6fe4fbec230c4e69057520ce0ab2"
  retries = 0
}

step "crds" {
  wkdir   = "renovate"
  target  = "renovate/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "renovate",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "renovate"
  target  = "renovate/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "renovate",
  ]

  sha     = "h1:yEhcgVo0rPmY0P8nUl7S0v6HFNt4cffEXHRU0/XuB2w="
  retries = 1
}
