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

  sha = "abc6a6a522df6483703e96e5898db33773d8528c8398395b989d6eb8047f085d"
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
