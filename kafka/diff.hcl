metadata {
  path = "kafka"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:aTIEuDmcrkYqdMq0UTbdM+rnm5LJQKMZaqwJP5yupKk="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kafka",
  ]

  sha     = "h1:aTIEuDmcrkYqdMq0UTbdM+rnm5LJQKMZaqwJP5yupKk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kafka",
  ]

  sha     = "95bede914702b8af2382cf71c23ba36e80a13fc0a05c19a3467c223736a96487"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kafka/helm"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kafka",
  ]

  sha     = "h1:FQ1J+2sfLiK4XPEzNU45pxl3nxv1DGW6h3xDydZAHrI="
  retries = 0
  verbose = false
}
