metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "218c86e2947e6046d0fbe1710b909473b03b3cefe613fa5d527c18698fa3ff17"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:J5AzHah/jSRxxWWVHZfhkdF0JrgUWZfnhu3AHMDwk8k="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:4J4IQp0zjToB84f/LJg1lxuDeVDBo+DZKDj9+m1/x7w="
  retries = 1
}
