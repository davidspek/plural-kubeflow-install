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

  sha     = "208faaf92f5b267fb2728551b896a16d06d40072f7580657e3118f5108a505d8"
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

  sha     = "h1:BaNp4SL8L4zRsLmodkMX9J1kC1sk7q3LABe57XPK38s="
  retries = 0
  verbose = false
}
