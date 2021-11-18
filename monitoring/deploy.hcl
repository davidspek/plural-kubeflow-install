metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:1LngqOAaJ6F29sqSib7KCwNUPpyacNpAm27vEUWMULU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:1LngqOAaJ6F29sqSib7KCwNUPpyacNpAm27vEUWMULU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:1LngqOAaJ6F29sqSib7KCwNUPpyacNpAm27vEUWMULU="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a715b6a6181281c69e9c9f62e3a2f9d4ffb31d08e08696baeeec155cdfe1bac3"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:J5AzHah/jSRxxWWVHZfhkdF0JrgUWZfnhu3AHMDwk8k="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:87LAWA34Kdu8QJwWS1Mo7MZH+UWkC0QoVB68oIRd2F0="
  retries = 1
}
