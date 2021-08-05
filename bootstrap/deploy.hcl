metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "3535052d0df7bb5dba23c76facf4eb2966730e113dfd20db850172c6c182c237"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:/uFnauwMQ7y5eB+EBYQ/vqbbrac9b266epQzzoUTw3c="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:1DZ4Z/e2cOkRfloe9OX45dxTpJ0QOgAKeM2i1VUwm7k="
}
