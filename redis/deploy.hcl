metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redis",
  ]

  sha = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "5f1177bf37707ed8f34be4f10ba0b1679513f2f607ba60502498e809db44cb60"
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha = "h1:TClkmt9a69mQKBWeq50kegG1GL9wLNgfyJONvicQOsM="
}
