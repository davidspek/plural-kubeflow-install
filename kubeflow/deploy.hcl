metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Z+cR52Tyl5fVJqmn+XuX8dHPAi2iMlKJQA21doEdKoA="
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Z+cR52Tyl5fVJqmn+XuX8dHPAi2iMlKJQA21doEdKoA="
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

  sha = "h1:Z+cR52Tyl5fVJqmn+XuX8dHPAi2iMlKJQA21doEdKoA="
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "b71c138191ac547007acf1fcc1b5a13bd825d6a36743f10503e53457fd2d1a41"
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

  sha = "h1:IYN1gYOCikuOnXPf47c05IiuPN+UXJLkeIuUi/TuG3s="
}
