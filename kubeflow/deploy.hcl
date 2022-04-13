metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
  retries = 1
}

step "terraform-output" {
  wkdir   = "kubeflow"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubeflow",
  ]

  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "80fd8448c61302e0742031023d29c3eea11b2f235216a96687ccc113539a5539"
  retries = 0
}

step "crds" {
  wkdir   = "kubeflow"
  target  = "kubeflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubeflow",
  ]

  sha     = "h1:XHW3idYjcfbH8XMijZZwk60Sz9fc4T2KfOEo+egfjZA="
  retries = 0
}

step "bounce" {
  wkdir   = "kubeflow"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubeflow",
  ]

  sha     = "h1:gRmV4zygZ+TcmBbetG/OhWiSWp6r//C3bhSYuiFfwrw="
  retries = 1
}
