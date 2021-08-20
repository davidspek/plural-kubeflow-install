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

  sha = "e7a382d6d056f12693822d6add71f8efa53d3f92f2e7316ad71a4a8a389a6969"
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
