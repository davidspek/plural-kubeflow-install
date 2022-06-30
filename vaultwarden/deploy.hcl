metadata {
  path = "vaultwarden"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:8UwUrJd5B8ciNdMiWGtGZiG/H3eS49JNJzknenfCzZQ="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:8UwUrJd5B8ciNdMiWGtGZiG/H3eS49JNJzknenfCzZQ="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "vaultwarden",
  ]

  sha     = "h1:8UwUrJd5B8ciNdMiWGtGZiG/H3eS49JNJzknenfCzZQ="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4599383164dea3aaad27f4426c91c211150bf9f9642a2d6ff5f18fdf60d6d21a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vaultwarden",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vaultwarden",
  ]

  sha     = "h1:rUUAIsbPP7EzUkBpry+CzK8zrvGyZP6sMSu+OmD3fBA="
  retries = 1
  verbose = false
}
