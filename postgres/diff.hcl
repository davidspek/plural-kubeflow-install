metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:iFG7EYP3Oi66SkTGRckK5oDtmLe6agb5CX2Ded7QjRA="
  retries = 0
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:iFG7EYP3Oi66SkTGRckK5oDtmLe6agb5CX2Ded7QjRA="
  retries = 0
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "0ec9f77569f0bf97efe5d2d5b463a7db20142c241fcae361123e5c860c1032eb"
  retries = 0
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:cTdD3qciaVlzbeId4Gk2Nax+3+goNAraAv96E3jEONY="
  retries = 0
}
