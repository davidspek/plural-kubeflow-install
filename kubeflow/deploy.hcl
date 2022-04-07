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

  sha     = "267996813f8dd5e0b6637df91970aaed400329c3aefa85da66565e155a6298db"
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

  sha     = "h1:EDrND1e5r1NB4UmlR6VY/pSxZ0N2lnWC9WmW+mbIgzE="
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

  sha     = "h1:AqIcBspLQ5AG+Aj3zwEpz1Se0rQEq4LMcMWMdskd2Dk="
  retries = 1
}
