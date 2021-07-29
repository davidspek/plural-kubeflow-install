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

  sha = "7c329d24ee00a9c1d0b4d4a8f34a151fb772005d381c79130e69268d8a4ad162"
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

  sha = "h1:Q99mVsDZnVI/bkA8sDiUhyzcV5XUwaCZV2qv9wc1pyM="
}
