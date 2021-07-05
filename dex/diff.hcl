metadata {
  path = "dex"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OzR43deT/mbh4IzydQr1VRdHUTTs242QdipErbBdaaY="
}

step "terraform" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "dex",
  ]

  sha = "h1:OzR43deT/mbh4IzydQr1VRdHUTTs242QdipErbBdaaY="
}

step "kube-init" {
  wkdir   = "dex"
  target  = "dex/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dex",
  ]

  sha = "fed70fa94d2a942af7465ee3faaeb7239e821d533c16c155294b3a1be276a3c9"
}

step "helm" {
  wkdir   = "dex/helm"
  target  = "dex/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dex",
  ]

  sha = "h1:HP4pPRb9mWFzop/L5WoN5F9a74fe+itXgPrGMGHkkGc="
}
