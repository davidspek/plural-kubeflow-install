metadata {
  path = "sentry"
  name = "diff"
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

step "terraform" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "sentry",
  ]

  sha     = "0236be2f3e62422d5c6f4670e47f08e389435d43fd5c0716ce116b40d47593c3"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "sentry/helm"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "sentry",
  ]

  sha     = "h1:9NawOUSogl6XQHTQ6wBYXbWRmCpu5sUfxEc99EQ39mc="
  retries = 0
  verbose = false
}
