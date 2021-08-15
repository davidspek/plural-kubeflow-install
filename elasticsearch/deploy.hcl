metadata {
  path = "elasticsearch"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:zvjx2Ep15YPH2S4fYWuDKuv97yC87m3BSZPqRgwHNrc="
}

step "terraform-apply" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:zvjx2Ep15YPH2S4fYWuDKuv97yC87m3BSZPqRgwHNrc="
}

step "terraform-output" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "a9e6a1540267bc659d014757c7823ea842d604798f4c42a6041ee34458e4c099"
}

step "crds" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "elasticsearch",
  ]

  sha = "h1:DwqXf+vVVp7K1KyleGMN514fujSfJ8T+OHHBOiyqry8="
}

step "bounce" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "elasticsearch",
  ]

  sha = "h1:cw5ovoKH/HP1Vj3mkQRZLOAcIDSWyZ7ZZsu+ke7F8ZI="
}
