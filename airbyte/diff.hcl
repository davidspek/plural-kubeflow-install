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

  sha     = "b85afaa1bf834a127f36255c34155bf437ae8f38b3695602d8259019855cde60"
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

  sha     = "h1:ftcEplGhb4Wqw1HBlnNA8DuVSzGd0g2WCYF4I9NFF94="
  retries = 0
}
