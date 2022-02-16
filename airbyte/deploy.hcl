metadata {
  path = "airbyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:iTaBoOt1kReaAU/jDFn4OTbqYDEgchuyCZhYaY7ll0k="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:iTaBoOt1kReaAU/jDFn4OTbqYDEgchuyCZhYaY7ll0k="
  retries = 1
}

step "terraform-output" {
  wkdir   = "airbyte"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airbyte",
  ]

  sha     = "h1:iTaBoOt1kReaAU/jDFn4OTbqYDEgchuyCZhYaY7ll0k="
  retries = 0
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

<<<<<<< HEAD
  sha     = "eeefa0a31b03480940be937192f4f42da69dc0ecbab817907f39fb91340c644b"
=======
  sha     = "4307b69aceff56e52004af5aa2f7abd9a42c8f542958a427d35bedff4d1c3e07"
>>>>>>> 39f8552c (redeploy all)
  retries = 0
}

step "crds" {
  wkdir   = "airbyte"
  target  = "airbyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airbyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "airbyte"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airbyte",
  ]

  sha     = "h1:1DB7HyB+13Q5krA9Yt/BnK5Eo6XZ+ryRgY3R8JnDjiw="
  retries = 1
}
