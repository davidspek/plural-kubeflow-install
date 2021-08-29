metadata {
  path = "nextcloud"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Rzulj4MtQ5aYc0mHHb1QNmN22Ez1e+boMywbKw5IJSo="
}

step "terraform" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "nextcloud",
  ]

  sha = "h1:Rzulj4MtQ5aYc0mHHb1QNmN22Ez1e+boMywbKw5IJSo="
}

step "kube-init" {
  wkdir   = "nextcloud"
  target  = "nextcloud/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "nextcloud",
  ]

  sha = "cb332b1daedfb9824e80568c9cb2633e0dcea89415204180965162786bb04c6c"
}

step "helm" {
  wkdir   = "nextcloud/helm"
  target  = "nextcloud/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nextcloud",
  ]

  sha = "h1:t769T3GArItDxrxWBhTSiu7f61DpVOEdVipEfngjVsI="
}
