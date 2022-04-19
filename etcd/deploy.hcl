metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:jaf3uvrceydRgE1KPSNmjK7a8AV6h2UYLeVzaCtbdrw="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:jaf3uvrceydRgE1KPSNmjK7a8AV6h2UYLeVzaCtbdrw="
  retries = 1
}

step "terraform-output" {
  wkdir   = "etcd"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "etcd",
  ]

  sha     = "h1:jaf3uvrceydRgE1KPSNmjK7a8AV6h2UYLeVzaCtbdrw="
  retries = 0
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "223d72867299d9a840c33637969e88536801c9b0ed61ab085bb7743c8163b757"
  retries = 0
}

step "crds" {
  wkdir   = "etcd"
  target  = "etcd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "etcd",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "etcd"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "etcd",
  ]

  sha     = "h1:rU6R+W6ZDIAd0uNtlKqgtp/tqU9Hf2bFQbUb9P5IWug="
  retries = 1
}
