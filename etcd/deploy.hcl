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
  verbose = false
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
  verbose = false
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
  verbose = false
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e780f500964ce3fe2df17230680ef331c4960028bcce795b063904dd97fa04fc"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:I/fnK4HqoeTvrEtI+Gbaz7dygZzvIvGD1rjSsWgnKZ4="
  retries = 1
  verbose = false
}
