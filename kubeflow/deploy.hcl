metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
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

  sha = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "ffe7290375f5f9d6ef952ed43605655c0b28f8c457d2f4b123038e465899b000"
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

  sha = "h1:hkgHneRZVJ+1F41d8wafBI3sr9nk50YrPdN8tBi0/DA="
}
