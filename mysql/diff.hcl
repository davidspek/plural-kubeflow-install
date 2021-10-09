metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eZD4yHxAR8A5M/fUTYyBOQuuhUh8qo6RyYEHR8sz3J0="
  retries = 0
}

step "terraform" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mysql",
  ]

  sha     = "h1:eZD4yHxAR8A5M/fUTYyBOQuuhUh8qo6RyYEHR8sz3J0="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha     = "7824bcb94f9a23469b4c178808da55b6f0cd58ac7bddb47a64d385942e95e95d"
  retries = 0
}

step "helm" {
  wkdir   = "mysql/helm"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mysql",
  ]

  sha     = "h1:BxUinDNjR3uB4Jf9TLACKky4IWke1YH1kMVQ9ddmg4Y="
  retries = 0
}
