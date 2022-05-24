metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubeflow",
  ]

  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubeflow",
  ]

  sha     = "7bd0ca6f9a53d0cd970c8fd08a0e29e442e5751d2273aa7516b7d6331bef5a57"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubeflow/helm"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubeflow",
  ]

  sha     = "h1:hT5q4UjkBY5ISHF+kutI4KB6FnF6FXT6kOplQYQbJDk="
  retries = 0
  verbose = false
}
