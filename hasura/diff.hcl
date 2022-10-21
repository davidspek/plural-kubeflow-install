metadata {
  path = "hasura"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:a4ucKJwmAPwLCEGaaLBheaMj5xyhbdM5Lrgcxgmt8YE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "hasura",
  ]

  sha     = "h1:a4ucKJwmAPwLCEGaaLBheaMj5xyhbdM5Lrgcxgmt8YE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "hasura"
  target  = "hasura/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "hasura",
  ]

  sha     = "69d01fbf0fd1b2d3df1a5e9483e3b411d3a4dddeab4c07378ee646344f52e7f6"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "hasura/helm"
  target  = "hasura/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "hasura",
  ]

  sha     = "h1:81ucekWbBh7DnLRCDwnyEWFvUMnzRk5qY59nC/h7DQ0="
  retries = 0
  verbose = false
}
