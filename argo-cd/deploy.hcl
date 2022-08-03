metadata {
  path = "argo-cd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:o1q9VZzs0zgcFYo5GVRVEuRyryoEfKsxEQGvqsMel9o="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:o1q9VZzs0zgcFYo5GVRVEuRyryoEfKsxEQGvqsMel9o="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-cd",
  ]

  sha     = "h1:o1q9VZzs0zgcFYo5GVRVEuRyryoEfKsxEQGvqsMel9o="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "cc737f5cacb56aa04f6039db591858bd77a5cae4db084452701c570189e6a8f8"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha     = "h1:C+IcOQPZtt5b7kOJR87hRIVvo49JEM2/oTRopzumeEM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha     = "h1:lwF7pbhigzgLKtFoWQg9PvaSS0cndkXlWOVgb8UbCis="
  retries = 1
  verbose = false
}
