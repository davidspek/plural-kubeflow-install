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

  sha     = "fc67c8f1c75d1c07cb66fe4cc760e19667cf0fcc87bdcd90ecc504ac62ac0ca0"
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

  sha     = "h1:YkVv+yt3nIg69jWWBE8BiZJ6annTYd3lN//4D7Ds9MQ="
  retries = 0
}
