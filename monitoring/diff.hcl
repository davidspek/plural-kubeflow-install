metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:gWN+wMe/RvaE/MZaU7f400bzVWewH+rDzewPOLUw9aQ="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:gWN+wMe/RvaE/MZaU7f400bzVWewH+rDzewPOLUw9aQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "f80145b064022d7a46c6cb8e468734d33086d7035a5a4b3af546ad0bbdb3e5e6"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:6uZv6Ea3mFZSU2YwAm5krek2YEpGSb4PPp+IyVcqKV8="
  retries = 0
}
