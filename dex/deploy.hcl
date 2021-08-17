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

  sha = "ed861628d8dcdff31df375c31f98dba1cb179f4d1d84cb339b3da4765fbf832b"
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

  sha = "h1:McwGjQSarFMOdgj87P3Ur1ePR4mhkHaMW5h8P/giJTg="
}
