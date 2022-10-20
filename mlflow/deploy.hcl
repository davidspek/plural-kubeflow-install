metadata {
  path = "mlflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:/HwoLT5Os8fXDBkVHIw7mpEbYdl3Q0aRW1U/l51VIQI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:/HwoLT5Os8fXDBkVHIw7mpEbYdl3Q0aRW1U/l51VIQI="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "mlflow"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mlflow",
  ]

  sha     = "h1:/HwoLT5Os8fXDBkVHIw7mpEbYdl3Q0aRW1U/l51VIQI="
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
  ]

  sha     = "ca0a812e46fb687be8b7506a43d9b4de5880d31b7c3cfa77e5518ca5c2e4b421"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "mlflow"
  target  = "mlflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mlflow",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "mlflow"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mlflow",
  ]

  sha     = "h1:2YSX+t+/RLXEUc/8b9ricb/NN1b5WZBpGfBj8YeNzrk="
  retries = 2
  verbose = false
}
