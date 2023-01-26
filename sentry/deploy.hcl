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

  sha     = "h1:fG5G9xjyRrGchdrFvDRNJdalcTH5n5SiVACDhdCvslw="
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

  sha     = "h1:fG5G9xjyRrGchdrFvDRNJdalcTH5n5SiVACDhdCvslw="
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

  sha     = "h1:fG5G9xjyRrGchdrFvDRNJdalcTH5n5SiVACDhdCvslw="
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

  sha     = "dd9ed58badd63abe9438827869ada9b4c7bfc00cd85fae145ae149c083dd1ae5"
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

  sha     = "h1:niqmhwKzMHfBc60tGYvBoCNJFlbYs1msedJn3ofSui8="
  retries = 2
  verbose = false
}
