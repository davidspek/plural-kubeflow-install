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
  verbose = false
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
  verbose = false
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

  sha     = "2aa51147c7177a093d006ae4c446b8d42acf164884dd6e655fe9002608c1407e"
  retries = 0
  verbose = false
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

  sha     = "h1:o9nugVWwprU5KQFmkg5N3GNb2QIc0BS4oaVl+GYBquc="
  retries = 0
  verbose = false
}
