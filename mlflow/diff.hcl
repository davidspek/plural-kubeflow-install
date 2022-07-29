metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:nhula5EbxrmoAzmukXLI1QvBkrtloB6YTY1pfWoRIKo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mlflow",
  ]

  sha     = "h1:nhula5EbxrmoAzmukXLI1QvBkrtloB6YTY1pfWoRIKo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "mlflow"
  target  = "mlflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mlflow",
  ]

  sha     = "c97dd8b7fc2bd988be9beece2c1d07b488e3aea1dd5219db11160bab0bca2361"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "mlflow/helm"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mlflow",
  ]

  sha     = "h1:J71r/gidJZsmfK3iL5vE7YCnh+R/V/KgwmP0UfhsCsY="
  retries = 0
  verbose = false
}
