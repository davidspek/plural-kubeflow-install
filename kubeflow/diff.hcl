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

  sha = "012257d3acdb4921ef41992808ec6a4ad19f48e0bfcfa69cef765ecbc521e0dd"
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

  sha = "h1:Z0iusVVwBR9MVVe5v/tyCVu19i39ZZYL6n+HrnfedKE="
}
