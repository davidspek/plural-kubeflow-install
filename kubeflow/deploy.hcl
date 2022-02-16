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

  sha     = "h1:91SKG8+PnzA1WLTwsjWcnWKTuZ689QUVzFHJZHt9CB4="
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

  sha     = "h1:91SKG8+PnzA1WLTwsjWcnWKTuZ689QUVzFHJZHt9CB4="
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

  sha     = "h1:91SKG8+PnzA1WLTwsjWcnWKTuZ689QUVzFHJZHt9CB4="
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

  sha     = "b298ecaf65d0e4a23d0a60605c783329e8b46864f78e15f460a264cdbcb18279"
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

  sha     = "h1:EDrND1e5r1NB4UmlR6VY/pSxZ0N2lnWC9WmW+mbIgzE="
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

  sha     = "h1:szFAXs5tl8TfwYJBhPE7C+kKFnZzf6TYqUk/QAP/Ddk="
  retries = 1
}
