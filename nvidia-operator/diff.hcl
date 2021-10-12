metadata {
  path = "nvidia-operator"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8pVbSfLmXDW0YItBuARWnNBieDBYLsRlTwV6V2XRRjQ="
  retries = 0
}

step "terraform" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "nvidia-operator",
  ]

  sha     = "3744bc9b18e37328b0e46ee47e69104989cdf0a0f866e8479c326a6282259f3e"
  retries = 0
}

step "helm" {
  wkdir   = "nvidia-operator/helm"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nvidia-operator",
  ]

  sha     = "h1:jPqdxoUfu1solTghAjnKkqg8W8OmOC8qhnMzelMUf5Y="
  retries = 0
}
