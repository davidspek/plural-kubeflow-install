metadata {
  path = "datahub"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:W4tl3OXKX9YrXFwupK7c1DoDmK9NybCK8kvd/t7f+Nk="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "datahub",
  ]

  sha     = "h1:W4tl3OXKX9YrXFwupK7c1DoDmK9NybCK8kvd/t7f+Nk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "datahub"
  target  = "datahub/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "datahub",
  ]

  sha     = "5a106e51805cac251fcb7a3a8b5bd6511a8e504f9ded9967e873de7f407d0e9b"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "datahub/helm"
  target  = "datahub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "datahub",
  ]

  sha     = "h1:XPDyUoom75zR//dMCfmrgVeKwR7zxtcsx4XhSMzjPoU="
  retries = 0
  verbose = false
}
