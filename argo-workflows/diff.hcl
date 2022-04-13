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

  sha     = "66507a5bafc92b817938170f70478df49e82a4c9c17ba0c69921c39f85010e7a"
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

  sha     = "h1:KkQKiBzV3rtV9LI237QfFaeNE24kH1MD29HgVR7yh48="
  retries = 0
}
