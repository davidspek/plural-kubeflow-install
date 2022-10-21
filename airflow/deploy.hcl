metadata {
  path = "airflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:nckvxvPsf45orB+Ny7OPwAMBZcLHg1EXNnOh/Z1BW2E="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:nckvxvPsf45orB+Ny7OPwAMBZcLHg1EXNnOh/Z1BW2E="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "airflow"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "efe54b9bc6d94b454089585fae0268c6534d056ccb60738a225a221c9b64d8ca"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "airflow"
  target  = "airflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airflow",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "airflow"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airflow",
  ]

  sha     = "h1:OWN0uqVSVAOxqsOrgE5uZgoj8Gwd/5ytvaVNkMGt6dY="
  retries = 2
  verbose = false
}
