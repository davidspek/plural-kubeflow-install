metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:o1q9VZzs0zgcFYo5GVRVEuRyryoEfKsxEQGvqsMel9o="
  retries = 0
  verbose = false
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
    "argo-cd",
  ]

  sha     = "e1dac96717d65f112ae829dd74797f50f9053234e977f11953b349b741c12459"
  retries = 0
  verbose = false
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

  sha     = "h1:lwF7pbhigzgLKtFoWQg9PvaSS0cndkXlWOVgb8UbCis="
  retries = 0
  verbose = false
}
