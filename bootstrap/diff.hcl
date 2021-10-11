metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:KZNk3AWeYVprHTJbADHkc1m5+IEBV934QZt0pzkZcUU="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "bootstrap",
  ]

  sha     = "d26362cde941b946beb2d763072d6fc45864189bb4c3961f1449c5dd1ccf0679"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:53kFkEPUG4CUuDbk0CXN92c6b15RX31ISYgfJ1EzHS4="
  retries = 0
}
