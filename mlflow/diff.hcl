metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:/HwoLT5Os8fXDBkVHIw7mpEbYdl3Q0aRW1U/l51VIQI="
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
    "mlflow",
  ]

  sha     = "74cb1adc4bcf141798d3cc38b04433112a955931c2ac5944b50d46ae8b9e0067"
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

  sha     = "h1:jaT/emLfrsCiav8wiFGG2wzSVWKo52iZKiZtoCXAnWw="
  retries = 0
  verbose = false
}
