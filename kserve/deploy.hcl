metadata {
  path = "kserve"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:g9JmUAIwnF8L7jlUNHcJhDJHXWOd41INRjGkIuVXz+Y="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:g9JmUAIwnF8L7jlUNHcJhDJHXWOd41INRjGkIuVXz+Y="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "kserve"
  target  = "kserve/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kserve",
  ]

  sha     = "h1:g9JmUAIwnF8L7jlUNHcJhDJHXWOd41INRjGkIuVXz+Y="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kserve"
  target  = "kserve/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d0f6f55d0799c63dde14a81424c6b202749e76cef2a723a11f8651edef0ecd5e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kserve"
  target  = "kserve/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kserve",
  ]

  sha     = "h1:lb3feKw48uWQw1MBhTMWyNsVmdclVXAoAyZX/Ou85GA="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kserve"
  target  = "kserve/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kserve",
  ]

  sha     = "h1:3buQYLXpQLmxl/fasdV+z+cePJog8bPUbWYEfIgAIwM="
  retries = 2
  verbose = false
}
