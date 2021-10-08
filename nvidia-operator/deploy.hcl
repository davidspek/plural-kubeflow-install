metadata {
  path = "nvidia-operator"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
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

  sha     = "9602f6e1c743383c1cfdb174fa3f6e3a9887d1915791030a11fa06e164c355e9"
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

  sha     = "h1:hEajuUG/qDLGzXeB88VnlXSSlSXcYLJdMevhlQLB8oM="
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

  sha     = "h1:+OEZOIXWgyp63i0M+AqBR3F8ldp5UNtXiNw2yqUjI8g="
  retries = 0
}
