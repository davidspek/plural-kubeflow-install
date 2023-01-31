metadata {
  path = "ray"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:hXdTUfAAJz0NG1VKrWAroMBG9F2W6Dq+Gqrftnsqfck="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ray",
  ]

  sha     = "h1:hXdTUfAAJz0NG1VKrWAroMBG9F2W6Dq+Gqrftnsqfck="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ray"
  target  = "ray/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ray",
  ]

  sha     = "c4e7842f492c81d467b41826357573bbc39d8afe98d8dc8251011f31576acac7"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ray/helm"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ray",
  ]

  sha     = "h1:4GTEZYV3VJd8qkl+chKLFrm+VsODPDarDCz9tZVyrA8="
  retries = 0
  verbose = false
}
