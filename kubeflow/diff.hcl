metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Z+cR52Tyl5fVJqmn+XuX8dHPAi2iMlKJQA21doEdKoA="
}

step "terraform" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "kubeflow",
  ]

  sha = "7dd46fda07ebeaa30950b3fdcb22d3bfb6b9778a588227cde0a17187de2f01f5"
}

step "helm" {
  wkdir   = "kubeflow/helm"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubeflow",
  ]

  sha = "h1:lsUd6B5EzVq0NdoQvM1vWy0ORdqhTkOtsP/Va6ZYGfA="
}
