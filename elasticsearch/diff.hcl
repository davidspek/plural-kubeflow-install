metadata {
  path = "elasticsearch"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:zvjx2Ep15YPH2S4fYWuDKuv97yC87m3BSZPqRgwHNrc="
}

step "terraform" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "elasticsearch",
  ]

  sha = "h1:zvjx2Ep15YPH2S4fYWuDKuv97yC87m3BSZPqRgwHNrc="
}

step "kube-init" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "elasticsearch",
  ]

  sha = "a9e6a1540267bc659d014757c7823ea842d604798f4c42a6041ee34458e4c099"
}

step "helm" {
  wkdir   = "elasticsearch/helm"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "elasticsearch",
  ]

  sha = "h1:cw5ovoKH/HP1Vj3mkQRZLOAcIDSWyZ7ZZsu+ke7F8ZI="
}
