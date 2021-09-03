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

  sha = "e4ba9504faa1d2535169139f425e2fb3087a9b84592e30d395e83ab34cfb63ab"
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

  sha = "h1:EquehmKV/c5aNwKy3Im1LAiGkUE8ANQCSTjJQfolsQc="
}
