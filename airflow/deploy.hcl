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

  sha     = "6dd512998846d0b4c220ecd9219121c5c30b03304e38f1b7ba3586c3d3a68625"
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

  sha     = "h1:S9QaBJuYszGN/aYAb3JEs7MDiQDg2am2oeQJsDJclJ4="
  retries = 2
  verbose = false
}
