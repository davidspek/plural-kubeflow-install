metadata {
  path = "oauth2-proxy"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "oauth2-proxy",
  ]

  sha = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "kube-init" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "oauth2-proxy",
  ]

  sha = "2dea22156e6c4abfa9acf9e15615ac2a981e6e6f268a5186c76bf8d5f10b3942"
}

step "helm" {
  wkdir   = "oauth2-proxy/helm"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oauth2-proxy",
  ]

  sha = "h1:B0CXmxskXXPX91HV5S64VV4wkClmFyUgWY1MQsEverY="
}
