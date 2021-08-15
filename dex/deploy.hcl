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
  ]

  sha = "b0a56c62237987fb4f91fb28fde367ce6ddd8b778677a515360f49134cb58f4a"
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

  sha = "h1:Qtk/3J/YVryM2f3cNWjytGNF16VGHBt+qktiKi6wn5c="
}
