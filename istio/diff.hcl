metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Szf5dLqEWA3yzRUac2dF7WHvGHbGLnbmVtrWk5IdALM="
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

  sha = "h1:Szf5dLqEWA3yzRUac2dF7WHvGHbGLnbmVtrWk5IdALM="
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

  sha = "81c093071b7a6596f4da3be4db19954861b3c5e67b51d61b2049a0c498fa7044"
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

  sha = "h1:J8Dfmf9veFSbyLlDq95Nbdg/cn6XU/4dvA//B6VLcEg="
}
