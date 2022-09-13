metadata {
  path = "argo-workflows"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ZdaFA3p3s+SX7C6Msi7G6+9WHCUJHxypMqNJcyKlx8w="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ZdaFA3p3s+SX7C6Msi7G6+9WHCUJHxypMqNJcyKlx8w="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-workflows",
  ]

  sha     = "h1:ZdaFA3p3s+SX7C6Msi7G6+9WHCUJHxypMqNJcyKlx8w="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4e87d8144086b06080d6ea162c62037600d2c9090076ef21e3e6fd84bef058c5"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-workflows",
  ]

  sha     = "h1:FtyHzEhEaLNLDGcU3J4DqEZCT0/LCYPvyf/Vg0VjyoE="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-workflows",
  ]

  sha     = "h1:NaLGMZGAD2X22zugMX6TMz8U48S6GI7ibtVRFYHvaQ4="
  retries = 2
  verbose = false
}
