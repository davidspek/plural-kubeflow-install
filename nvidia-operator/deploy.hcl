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

  sha     = "h1:Mw3jijLnavltnsvORHJ6OZYBpNjKHLy+pqHEfRM3TFM="
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

  sha     = "h1:Mw3jijLnavltnsvORHJ6OZYBpNjKHLy+pqHEfRM3TFM="
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

  sha     = "h1:Mw3jijLnavltnsvORHJ6OZYBpNjKHLy+pqHEfRM3TFM="
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

  sha     = "2ad92272543efa559086fd56c0ce23a9eb69cb5d8132679972ddfd12ecc0dd30"
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

  sha     = "h1:Hx+DXzdpc4AqFc95pB2c7NcxIfCjs06y9tMq7ZLY7rA="
  retries = 1
}
