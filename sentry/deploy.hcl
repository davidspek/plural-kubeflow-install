metadata {
  path = "sentry"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:AmIcDDV+cbAwF2eZA5T+JVYbocDVrDlAliSnRMBqiUc="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:AmIcDDV+cbAwF2eZA5T+JVYbocDVrDlAliSnRMBqiUc="
  retries = 1
}

step "terraform-output" {
  wkdir   = "sentry"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "sentry",
  ]

  sha     = "h1:AmIcDDV+cbAwF2eZA5T+JVYbocDVrDlAliSnRMBqiUc="
  retries = 0
}

step "kube-init" {
  wkdir   = "sentry"
  target  = "sentry/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "276f202bc831e0e9480b21cad47e1d9248b20a87612e5d58ef2f4c72cba9aab2"
  retries = 0
}

step "crds" {
  wkdir   = "sentry"
  target  = "sentry/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "sentry",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "sentry"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "sentry",
  ]

  sha     = "h1:yCoj88/VxU74LX5LZ0c5axH22Z5iayvR/ci64yUgTEE="
  retries = 1
}
