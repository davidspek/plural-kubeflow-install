metadata {
  path = "ray"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:6QKoqzttJ3OAZA8uWIUY8bIYad9IC8AWsSmIBLgIAMc="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "ray",
  ]

  sha     = "12171dc1944ff3cc2ce484a5c653c6c73037e7d00e3b7847a273b32e8547386a"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ray/helm"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ray",
  ]

  sha     = "h1:E92KOoD+oHOxB4E5JXLa78MvFskKMN6445JsYUNN3hc="
  retries = 0
  verbose = false
}
