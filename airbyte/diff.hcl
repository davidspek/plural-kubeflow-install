metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
  retries = 0
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
  retries = 0
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "b054cbcfd2137f755543ef8629788c3808acd377acf92844c7b3a0883e7a2dcb"
  retries = 0
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:rjk7fUTAUpe85OCfFHhsruPx8KjQg4/etG6sy+tiwqw="
  retries = 0
}
