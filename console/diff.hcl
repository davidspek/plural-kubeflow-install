metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
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

  sha = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
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

  sha = "493ce75eba49b8d1d4b3f1aaff2d24a4e051d88adee284d0c03f4240b49efd67"
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

  sha = "h1:eaIu0LiaGvi0jbnYBGgD9CPDKGLNU9JhxuZsmJqSRv4="
}
