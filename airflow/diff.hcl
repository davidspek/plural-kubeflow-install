metadata {
  path = "airflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:nckvxvPsf45orB+Ny7OPwAMBZcLHg1EXNnOh/Z1BW2E="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airflow",
  ]

  sha     = "h1:nckvxvPsf45orB+Ny7OPwAMBZcLHg1EXNnOh/Z1BW2E="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airflow",
  ]

  sha     = "efe54b9bc6d94b454089585fae0268c6534d056ccb60738a225a221c9b64d8ca"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airflow/helm"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airflow",
  ]

  sha     = "h1:OWN0uqVSVAOxqsOrgE5uZgoj8Gwd/5ytvaVNkMGt6dY="
  retries = 0
  verbose = false
}
