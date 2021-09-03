metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pZRWSHbUF3D38OiovVluqR3LuLIwKNMAEb1Ii+9Vn6Q="
}

step "terraform-apply" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:pZRWSHbUF3D38OiovVluqR3LuLIwKNMAEb1Ii+9Vn6Q="
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

  sha = "h1:pZRWSHbUF3D38OiovVluqR3LuLIwKNMAEb1Ii+9Vn6Q="
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "ec69a2862807b8d2c5e73e34ad5f20e225418583c47d0433be428c64803d22a8"
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

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
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

  sha = "h1:8Cgkw/rzVdYW8hMGDrGfO0v1IBT3u3HAQ3+HxKOtom8="
}
