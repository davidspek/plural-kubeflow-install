metadata {
  path = "wireguard"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "wireguard/terraform"
  target  = "wireguard/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:sI+ka3jQ/PiLecnwq6Nhbtwh0/7QUK8AkO4q3XeNsI4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "wireguard/terraform"
  target  = "wireguard/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:sI+ka3jQ/PiLecnwq6Nhbtwh0/7QUK8AkO4q3XeNsI4="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "wireguard"
  target  = "wireguard/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "wireguard",
  ]

  sha     = "h1:sI+ka3jQ/PiLecnwq6Nhbtwh0/7QUK8AkO4q3XeNsI4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "wireguard"
  target  = "wireguard/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e80d2258d6c210be9c070175701df304c5436b6c93849019833752fe655aabc0"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "wireguard"
  target  = "wireguard/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "wireguard",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "wireguard"
  target  = "wireguard/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "wireguard",
  ]

  sha     = "h1:VTT9B8RVH2J20KGAuMMqGGTQ1V5xYUGCoLEp4Kg9GgE="
  retries = 2
  verbose = false
}
