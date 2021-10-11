metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:KZNk3AWeYVprHTJbADHkc1m5+IEBV934QZt0pzkZcUU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:KZNk3AWeYVprHTJbADHkc1m5+IEBV934QZt0pzkZcUU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:KZNk3AWeYVprHTJbADHkc1m5+IEBV934QZt0pzkZcUU="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d26362cde941b946beb2d763072d6fc45864189bb4c3961f1449c5dd1ccf0679"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:iQ7W6qI2ks1njRDSnqFmXYywWNGOPd/TPiV0JAFlmeg="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:53kFkEPUG4CUuDbk0CXN92c6b15RX31ISYgfJ1EzHS4="
  retries = 1
}
