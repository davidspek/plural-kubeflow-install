metadata {
  path = "vaultwarden"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8UwUrJd5B8ciNdMiWGtGZiG/H3eS49JNJzknenfCzZQ="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "vaultwarden",
  ]

  sha     = "4599383164dea3aaad27f4426c91c211150bf9f9642a2d6ff5f18fdf60d6d21a"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "vaultwarden/helm"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "vaultwarden",
  ]

  sha     = "h1:rUUAIsbPP7EzUkBpry+CzK8zrvGyZP6sMSu+OmD3fBA="
  retries = 0
  verbose = false
}
