metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ebAbArQeIdXmiQlNVVQoh3BjLOynDLS55QURwbwAyg8="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ebAbArQeIdXmiQlNVVQoh3BjLOynDLS55QURwbwAyg8="
  retries = 1
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

  sha     = "h1:ebAbArQeIdXmiQlNVVQoh3BjLOynDLS55QURwbwAyg8="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8c45529657d36da89e412b8f70174e32a29d3fb2cd463a217ec60d345df736e4"
  retries = 0
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

  sha     = "h1:Jh/A8qK7ArGDO1D3dIRxUW9lWnbI/k9PzkilGhjCFiM="
  retries = 0
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

  sha     = "h1:TvnjD4m24QWzGbVMZcT3HX/AnETRP3W0NlHK21X5Ijc="
  retries = 1
}
