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

  sha     = "e4256c1c4436b2205ea4593b65f9d1f5af7d967b63dc9d05e5732deb85e1d2e1"
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

  sha     = "h1:CS4nGZMJEu0BBzoTf2lXFX+ul0k6feHTxa0RKIPGMws="
  retries = 1
}
