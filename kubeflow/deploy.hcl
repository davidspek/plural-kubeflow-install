metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HQQpFZNNLc0rjp3VFEs53Z3OrAQYg2/BEOTEnzos2Hk="
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:HQQpFZNNLc0rjp3VFEs53Z3OrAQYg2/BEOTEnzos2Hk="
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

  sha = "h1:HQQpFZNNLc0rjp3VFEs53Z3OrAQYg2/BEOTEnzos2Hk="
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "3680ed90b190c7318404df9e1b4e89cbbaf0d583bc024279ac0cacb4194ea69c"
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

  sha = "h1:+yltOFb7wj8ndcPY8djbkWWGxBzEd8XkCJw4AwgZxGM="
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

  sha = "h1:u0W12VKkwfJgv5c72db+ysYmayTjtb5O064emioVX5k="
}
