metadata {
  path = "gitlab"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "gitlab/terraform"
  target  = "gitlab/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:t017eskVIrFXE/Z3twCBxHfbGVO2qcTiN6EyzxVXues="
}

step "terraform-apply" {
  wkdir   = "gitlab/terraform"
  target  = "gitlab/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:t017eskVIrFXE/Z3twCBxHfbGVO2qcTiN6EyzxVXues="
}

step "terraform-output" {
  wkdir   = "gitlab"
  target  = "gitlab/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "gitlab",
  ]

  sha = "h1:t017eskVIrFXE/Z3twCBxHfbGVO2qcTiN6EyzxVXues="
}

step "kube-init" {
  wkdir   = "gitlab"
  target  = "gitlab/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "679a66ff77b5459c8ed9a26abc506e01038c15f14ef3671157af099c7b4e4ee2"
}

step "crds" {
  wkdir   = "gitlab"
  target  = "gitlab/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "gitlab",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "gitlab"
  target  = "gitlab/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "gitlab",
  ]

  sha = "h1:1J0lfDK3otFH1u3c2bSIpmz6ST12aK8YOAqhSEe1KLc="
}
