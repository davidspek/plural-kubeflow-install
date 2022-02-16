metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:iTaBoOt1kReaAU/jDFn4OTbqYDEgchuyCZhYaY7ll0k="
  retries = 0
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "airbyte",
  ]

  sha     = "eeefa0a31b03480940be937192f4f42da69dc0ecbab817907f39fb91340c644b"
  retries = 0
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:1DB7HyB+13Q5krA9Yt/BnK5Eo6XZ+ryRgY3R8JnDjiw="
  retries = 0
}
