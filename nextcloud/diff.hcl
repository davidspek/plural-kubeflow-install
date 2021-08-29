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

  sha = "2443b26c538234d5eb7962adf46ce8db246ae58f1a3f5d0ff25e924cba90e58c"
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

  sha = "h1:3ZYV1S436eg7ot7tkWV/ZcYKAIkx60kfAJmYzDZTZqA="
}
