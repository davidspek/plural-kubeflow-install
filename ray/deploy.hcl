metadata {
  path = "ray"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:uadhWK3o/2INBDzUkZKWG+BotKnf9gQuiRDN7YP/oSE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:uadhWK3o/2INBDzUkZKWG+BotKnf9gQuiRDN7YP/oSE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "ray"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ray",
  ]

  sha     = "h1:uadhWK3o/2INBDzUkZKWG+BotKnf9gQuiRDN7YP/oSE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ray"
  target  = "ray/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e416990c5a09340be0f4fec1ed07aeed9d31829cc46333be1f6b95ead85f9f69"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "ray"
  target  = "ray/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ray",
  ]

  sha     = "h1:XdwvknRmZrUy3txsV+Vo+bRMD9pRE7CJk/T8+jVAPIA="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "ray"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ray",
  ]

  sha     = "h1:l+WFblyDLUTX/I+uvwQo0sL2sHsVwSMCPtsJMr1BUL8="
  retries = 2
  verbose = false
}
