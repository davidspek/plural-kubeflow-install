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

  sha     = "h1:1Quiw/CcarQNhE3N69KN4w55vJjBaFaE4KhjFMRYkWo="
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

  sha     = "h1:1Quiw/CcarQNhE3N69KN4w55vJjBaFaE4KhjFMRYkWo="
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

  sha     = "h1:1Quiw/CcarQNhE3N69KN4w55vJjBaFaE4KhjFMRYkWo="
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

  sha     = "98015c0e8f8f564c155aa2f479570f54b4d3f6c68d4f52523ee8ecce538104e6"
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

  sha     = "h1:RdE17m6CtQmI3fDyP1HiHooUMslo/7ZacD7oIuskXYc="
  retries = 2
  verbose = false
}
