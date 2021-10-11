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

  sha     = "f6dfcd33c8b8203742ec43171e3c650eed54d5d90dc985b6a10e6cad4c7953ba"
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

  sha     = "h1:+rS7Ze5R22DLbT1VWWIq9Bq/gj+ElrzmmZwVGDFZRQs="
  retries = 0
}
