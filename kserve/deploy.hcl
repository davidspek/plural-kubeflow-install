metadata {
  path = "kserve"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:2q9OnJ6BlnyS0rGzANhS3xV5E9YjjJ27QTKMWMn4Sv4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:2q9OnJ6BlnyS0rGzANhS3xV5E9YjjJ27QTKMWMn4Sv4="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "kserve"
  target  = "kserve/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kserve",
  ]

  sha     = "h1:2q9OnJ6BlnyS0rGzANhS3xV5E9YjjJ27QTKMWMn4Sv4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kserve"
  target  = "kserve/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e21f57423b2109c3c0337a1cb7290831bcb0fa80e07ddc5c79569fbd27bb87a7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kserve"
  target  = "kserve/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kserve",
  ]

  sha     = "h1:lb3feKw48uWQw1MBhTMWyNsVmdclVXAoAyZX/Ou85GA="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kserve"
  target  = "kserve/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kserve",
  ]

  sha     = "h1:eSO5mg0r/+SqGbqEmHbkmZEj5X1+KlQhutORmIwJy/Y="
  retries = 1
  verbose = false
}
