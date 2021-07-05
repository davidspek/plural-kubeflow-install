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

  sha = "477582d2cb86040d10badf29133339e757e28fef7a976aa242124dbaebec1d21"
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

  sha = "h1:BoQJ3GerFoJR1HIgubgNnG3pULQc+JVHUlJhXJVBPpw="
}
