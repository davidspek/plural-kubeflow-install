metadata {
  path = "loki"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "loki"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "loki",
  ]

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 0
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a42285b82a1e19e1b53d7fd80dd04e008b50ed60b45fa8da0073f7d9fe621adb"
  retries = 0
}

step "crds" {
  wkdir   = "loki"
  target  = "loki/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "loki",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "loki"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "loki",
  ]

  sha     = "h1:9wyqICIk+C2+fFFBRjGiJJXZTFF+rconaCdzFkpMjyw="
  retries = 1
}
