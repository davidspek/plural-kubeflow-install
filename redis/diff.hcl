metadata {
  path = "redis"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:epHZ3Hwh1WbEhUPLG77H/vz6wChOybYPtFok/mxtdtg="
}

step "terraform" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "redis",
  ]

  sha = "5f1177bf37707ed8f34be4f10ba0b1679513f2f607ba60502498e809db44cb60"
}

step "helm" {
  wkdir   = "redis/helm"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "redis",
  ]

  sha = "h1:TClkmt9a69mQKBWeq50kegG1GL9wLNgfyJONvicQOsM="
}
