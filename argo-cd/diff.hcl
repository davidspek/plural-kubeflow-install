metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:oXu5GY93sxzNl2y524wyz1TCNXFRU8x1kbheIb5KmNw="
}

step "terraform" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-cd",
  ]

  sha = "h1:oXu5GY93sxzNl2y524wyz1TCNXFRU8x1kbheIb5KmNw="
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-cd",
  ]

  sha = "4a83ba215914ad6b40d613b9ed85abad6a0e66c0dca002cb0cd5471503dcf64e"
}

step "helm" {
  wkdir   = "argo-cd/helm"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-cd",
  ]

  sha = "h1:q4vfxKxNaqeBN3OgQ2i1orCguksNT0xskOz96eAKi2I="
}
