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

  sha     = "a1c99cd57a426532fbc7c033d217ef5a03985de7a83cf1622bd9724b828f5a17"
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

  sha     = "h1:kAHAeTzkPEtv7TVuve66A85snrfeGlmbkKidNQpRmJA="
  retries = 0
}
