metadata {
  path = "argo-workflows"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ZdaFA3p3s+SX7C6Msi7G6+9WHCUJHxypMqNJcyKlx8w="
  retries = 0
}

step "terraform" {
  wkdir   = "argo-workflows/terraform"
  target  = "argo-workflows/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-workflows",
  ]

  sha     = "h1:ZdaFA3p3s+SX7C6Msi7G6+9WHCUJHxypMqNJcyKlx8w="
  retries = 0
}

step "kube-init" {
  wkdir   = "argo-workflows"
  target  = "argo-workflows/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-workflows",
  ]

  sha     = "f49d1adb66d4bb69ec392e0700e7981b480cf3e907b192767964f9c2bc623f5d"
  retries = 0
}

step "helm" {
  wkdir   = "argo-workflows/helm"
  target  = "argo-workflows/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-workflows",
  ]

  sha     = "h1:dIA00X6LKOh+a+RQKs7gJmg887OiJ40yIDMckuNSFCE="
  retries = 0
}
