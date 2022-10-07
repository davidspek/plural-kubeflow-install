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

  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
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

  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
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

  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
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

  sha     = "12171dc1944ff3cc2ce484a5c653c6c73037e7d00e3b7847a273b32e8547386a"
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

  sha     = "h1:E92KOoD+oHOxB4E5JXLa78MvFskKMN6445JsYUNN3hc="
  retries = 2
  verbose = false
}
