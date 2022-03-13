metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:dcuAFvFLSoJ7pMR/Hy9BRjSa9ahfn3u5ZuWhSnmb+S0="
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

  sha     = "h1:dcuAFvFLSoJ7pMR/Hy9BRjSa9ahfn3u5ZuWhSnmb+S0="
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

  sha     = "80c0c47cd0899d38e7535f194d32c60c4a3178a5335569678936cd4c4e705428"
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

  sha     = "h1:cIzDmsKq2bEOBhOdfW4J4UEQsUEi3kQPwBSArGEWGso="
  retries = 0
}
