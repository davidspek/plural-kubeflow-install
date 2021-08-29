metadata {
  path = "nextcloud"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:wFvtMvsfyFCGC26j62AEfSAOIqufqYEJKXOMhHEN9KY="
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

  sha = "h1:wFvtMvsfyFCGC26j62AEfSAOIqufqYEJKXOMhHEN9KY="
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

  sha = "4646bd8662d9f978dc7ac1bc76a944a35ac45453f49d6fbcdccb02bbc8aecc74"
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

  sha = "h1:IgjpadXJgVjMYnFKal7+RXRI6lesr+T/0ZPMPwvTLrE="
}
