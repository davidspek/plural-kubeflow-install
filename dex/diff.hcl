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

  sha = "b0a56c62237987fb4f91fb28fde367ce6ddd8b778677a515360f49134cb58f4a"
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

  sha = "h1:Qtk/3J/YVryM2f3cNWjytGNF16VGHBt+qktiKi6wn5c="
}
