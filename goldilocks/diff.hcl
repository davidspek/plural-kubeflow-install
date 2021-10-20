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

  sha     = "93802260034fd3555e2332b985e8543a81dc93566a8970cd3972fb7e6d746b8e"
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

  sha     = "h1:XwnwzZSH4j8vHNu96Yug6xq2SRIEg4g9xyOUzyl85HM="
  retries = 0
}
