metadata {
  path = "nextcloud"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:J3Kcsq8jrvG7BoazMJ2d/RBmqfb1q13bhbnGgkUSC/I="
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

  sha = "h1:J3Kcsq8jrvG7BoazMJ2d/RBmqfb1q13bhbnGgkUSC/I="
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

  sha = "8363398efa5d88844e269f835e2b57a91a7d34df0317858327d1fea44f18eaa6"
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

  sha = "h1:m223hV7daYmrxUyBkdMLk6nPVAC+r7HazNMj3J9YW3U="
}
