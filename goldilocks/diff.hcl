metadata {
  path = "goldilocks"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:94b6A1wct5LsbHtKM3hYTOhq+SSR/ij02MTqJfWy+KI="
  retries = 0
}

step "terraform" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "goldilocks",
  ]

  sha     = "h1:94b6A1wct5LsbHtKM3hYTOhq+SSR/ij02MTqJfWy+KI="
  retries = 0
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "goldilocks",
  ]

  sha     = "be1e4d7ea5e2c3d9ffe4b1133cb194602fa79b4d372bd30915268117eebbfb78"
  retries = 0
}

step "helm" {
  wkdir   = "goldilocks/helm"
  target  = "goldilocks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "goldilocks",
  ]

  sha     = "h1:ohOW7BXCEak0ipkhvtwHGfRsgCdADsGceSVzXCuYoH8="
  retries = 0
}
