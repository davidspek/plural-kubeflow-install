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

  sha     = "h1:bwBncxFEd/uQ0NhF8ASKbSGZtV06cy2x3JO2WVLGNcE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:bwBncxFEd/uQ0NhF8ASKbSGZtV06cy2x3JO2WVLGNcE="
  retries = 2
  verbose = false
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

  sha     = "h1:bwBncxFEd/uQ0NhF8ASKbSGZtV06cy2x3JO2WVLGNcE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "c9107ee23dd3123b245fb37530577196b4d17f4e9988b3d5528ae78ce2fcb19c"
  retries = 0
  verbose = false
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

  sha     = "h1:t5FX13K5805hSb5jzTOmMhUKVOuLAwejhp3iyG/QLBc="
  retries = 0
  verbose = false
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

  sha     = "h1:POtZG1nEz1CU3rpfGZhcA3K1CUjYFt5ZGGsyWeIMmJk="
  retries = 2
  verbose = false
}
