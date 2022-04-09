metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:xlS8tycZ9tnxgdkQCv24X++2K0fXm6qca9FEjOmIjIY="
  retries = 0
}

step "terraform" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubecost",
  ]

  sha     = "h1:xlS8tycZ9tnxgdkQCv24X++2K0fXm6qca9FEjOmIjIY="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubecost",
  ]

  sha     = "e99949b0e13ceb40c63ffe62cef6160e4cdcd74ed37719814ea53696c1f8f77e"
  retries = 0
}

step "helm" {
  wkdir   = "kubecost/helm"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubecost",
  ]

  sha     = "h1:d40KCnF+NxlgMkA2gB+NIo13orPrKF9sfqPM0Q3fm7A="
  retries = 0
}
