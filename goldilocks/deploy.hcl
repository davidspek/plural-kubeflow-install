metadata {
  path = "goldilocks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:+TZo65XRt3B8kXRUwh845mvDWfj1xNDSQl+4U1aM/4A="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:+TZo65XRt3B8kXRUwh845mvDWfj1xNDSQl+4U1aM/4A="
  retries = 1
}

step "terraform-output" {
  wkdir   = "goldilocks"
  target  = "goldilocks/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "goldilocks",
  ]

  sha     = "h1:+TZo65XRt3B8kXRUwh845mvDWfj1xNDSQl+4U1aM/4A="
  retries = 0
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "13a1d097e86f6dfcf8172d4f479ec7cbe1136b0feacd43d8eb38506cb20bf7fd"
  retries = 0
}

step "crds" {
  wkdir   = "goldilocks"
  target  = "goldilocks/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "goldilocks",
  ]

  sha     = "h1:H4a+KYlIqROhiD54T8DO+u8GcPZMGnmdxVjHY5QqobM="
  retries = 0
}

step "bounce" {
  wkdir   = "goldilocks"
  target  = "goldilocks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "goldilocks",
  ]

  sha     = "h1:mspxWy9KVcn5UMjhaJYl+v+nqt6s/TUHP7ZPInDlsPg="
  retries = 0
}
