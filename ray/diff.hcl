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

  sha     = "8fa440bda1a63f62bcb369d64faf978fb15a010749232fe89fb17a4056114cd0"
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

  sha     = "h1:73ANn3c2nNIYvkNfTLA3ZJCSLcl5YdjMJmM/8F0pCx8="
  retries = 0
  verbose = false
}
