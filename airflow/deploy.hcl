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

  sha     = "8f184d489e654c554ed81d934ede92ef888d0c51da2ac5704c32b2b68b46a642"
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

  sha     = "h1:kNUFdIDnPqakuUQ9/X35ZONEoKR1GstB/REe4yFaoR0="
  retries = 2
  verbose = false
}
