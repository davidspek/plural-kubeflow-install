metadata {
  path = "oncall"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:J7y78yTcQJdhst5RhCLiMM43pPt8aJDXy7Dsnz7Wtjg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "oncall",
  ]

  sha     = "h1:J7y78yTcQJdhst5RhCLiMM43pPt8aJDXy7Dsnz7Wtjg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "oncall"
  target  = "oncall/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "oncall",
  ]

  sha     = "a27f0167c80ee6700d02b23fbd7cb2c842bc0b330200f539fda447024e81e56e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "oncall/helm"
  target  = "oncall/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oncall",
  ]

  sha     = "h1:5vcgaA57UYlYKTjcT8o5P92uTKodY7IEk4g3oBwxX/g="
  retries = 0
  verbose = false
}
