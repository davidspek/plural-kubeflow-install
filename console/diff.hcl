metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:kXvyKokaq2ACg2spD73fw/SO3gHeHE6CJllppE3osFM="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "f96783b6a27a3c1aa9643770e4a24f591fa52be8ecfa275f9bd3f25e48e16dc1"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:KOEeNsBW241FXroTU5BjnpKxR/ft4ikLuYsz0xCb698="
  retries = 0
}
