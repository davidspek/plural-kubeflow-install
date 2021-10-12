metadata {
  path = "nvidia-operator"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:8pVbSfLmXDW0YItBuARWnNBieDBYLsRlTwV6V2XRRjQ="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:8pVbSfLmXDW0YItBuARWnNBieDBYLsRlTwV6V2XRRjQ="
  retries = 1
}

step "terraform-output" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nvidia-operator",
  ]

  sha     = "h1:8pVbSfLmXDW0YItBuARWnNBieDBYLsRlTwV6V2XRRjQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "3744bc9b18e37328b0e46ee47e69104989cdf0a0f866e8479c326a6282259f3e"
  retries = 0
}

step "crds" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nvidia-operator",
  ]

  sha     = "h1:2blKLDz++qBHLRzS62oZWipyvmesKkX5jyvElMH0CP0="
  retries = 0
}

step "bounce" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nvidia-operator",
  ]

  sha     = "h1:jPqdxoUfu1solTghAjnKkqg8W8OmOC8qhnMzelMUf5Y="
  retries = 1
}
