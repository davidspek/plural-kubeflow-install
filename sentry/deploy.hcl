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

  sha     = "h1:w1fGbF8gqopmQ6pgfLC5w08KPYBC6+lJrKEZa7Etol8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:w1fGbF8gqopmQ6pgfLC5w08KPYBC6+lJrKEZa7Etol8="
  retries = 2
  verbose = false
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

  sha     = "h1:w1fGbF8gqopmQ6pgfLC5w08KPYBC6+lJrKEZa7Etol8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "sentry"
  target  = "sentry/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0236be2f3e62422d5c6f4670e47f08e389435d43fd5c0716ce116b40d47593c3"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:9NawOUSogl6XQHTQ6wBYXbWRmCpu5sUfxEc99EQ39mc="
  retries = 2
  verbose = false
}
