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

  sha = "fa3c9b55ac883f3c7360538a549091c325da81123e75c9eeab2bbd11ee4dea99"
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

  sha = "h1:eOeHIKsOTcCcwAT+tdopQHRwdEIqox3hf9NjR/DY6E0="
}
