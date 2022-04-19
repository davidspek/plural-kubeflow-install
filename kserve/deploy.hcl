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
}

step "kube-init" {
  wkdir   = "kserve"
  target  = "kserve/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "52b06c3345a867b01fd245463a7d9c4dfa99371dab62d603c2e9b3ae955feec1"
  retries = 0
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

  sha     = "h1:bV3wOdnSBxD25lxaiZAUXD/giRaI7i3NXsnx7qRZHi4="
  retries = 1
}
