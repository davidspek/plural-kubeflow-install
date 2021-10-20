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

  sha     = "45dffbfffc6bf4c0595a648bd3736ab85fbd56b8d43ea2a7ae629f53ae3e4ab2"
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

  sha     = "h1:fUpb4p4DLo3TE4bKQTtSbFjV4I99TnHL0Ha6r/XWwgA="
  retries = 0
}
