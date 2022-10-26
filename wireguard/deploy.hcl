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

  sha     = "dad07b9361c1fd19b7c297cd01b5dc14d8fa1c4fdaa0e595f20c718577280770"
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

  sha     = "h1:zHxo1vUWpXYrSgV09yV+DpzmFCa/eozwIKrrP17LXkc="
  retries = 2
  verbose = false
}
