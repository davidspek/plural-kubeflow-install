metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:lOX78fTnnMZLn7AVqDNugOEY0dEsb7DaxvNE3ysA6NM="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:lOX78fTnnMZLn7AVqDNugOEY0dEsb7DaxvNE3ysA6NM="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "16f49e731e1497a753e934885da586569f169c9f2072e457a15aa5bec128922a"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:AqI2y+59kBKE1oL52dOaTFWxbtkoJpE9BNktbSjKmMw="
  retries = 0
}
