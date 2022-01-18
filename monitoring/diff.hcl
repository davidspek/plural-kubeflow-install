metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "e38f4ec672684ca721dc80208f9a94d90daf17ca5f6a0ab881feca9bdc8e897d"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:ZHOCDUSjFJ+X3rYnsT6ZE5vSSrJBGh3JnsX1LLf99ho="
  retries = 0
}
