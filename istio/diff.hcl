metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pk9tDVS0S08kzQit9SAZygePKs1XMBrR+PTSbQCyCVc="
  retries = 0
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha     = "h1:pk9tDVS0S08kzQit9SAZygePKs1XMBrR+PTSbQCyCVc="
  retries = 0
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha     = "0f80beaab9bc2fb443058c922dd8987996b0fbb7b949353ab25bbdbc76285cce"
  retries = 0
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha     = "h1:NjXk2Yyv7oekMFRYkIHXn3CTUvXFTwUSe/Q40ofL+lo="
  retries = 0
}
