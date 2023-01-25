metadata {
  path = "airflow"
  name = "diff"
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

  sha     = "8f184d489e654c554ed81d934ede92ef888d0c51da2ac5704c32b2b68b46a642"
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

  sha     = "h1:kNUFdIDnPqakuUQ9/X35ZONEoKR1GstB/REe4yFaoR0="
  retries = 0
  verbose = false
}
