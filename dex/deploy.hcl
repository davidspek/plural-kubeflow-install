metadata {
  path = "dex"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OzR43deT/mbh4IzydQr1VRdHUTTs242QdipErbBdaaY="
}

step "terraform-apply" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:OzR43deT/mbh4IzydQr1VRdHUTTs242QdipErbBdaaY="
}

step "terraform-output" {
  wkdir   = "dex"
  target  = "dex/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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

step "crds" {
  wkdir   = "dex"
  target  = "dex/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "dex",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "dex"
  target  = "dex/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "dex",
  ]

  sha = "h1:HP4pPRb9mWFzop/L5WoN5F9a74fe+itXgPrGMGHkkGc="
}
