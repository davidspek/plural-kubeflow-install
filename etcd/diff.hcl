metadata {
  path = "etcd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pZRWSHbUF3D38OiovVluqR3LuLIwKNMAEb1Ii+9Vn6Q="
}

step "terraform" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "etcd",
  ]

  sha = "e4ba9504faa1d2535169139f425e2fb3087a9b84592e30d395e83ab34cfb63ab"
}

step "helm" {
  wkdir   = "etcd/helm"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "etcd",
  ]

  sha = "h1:EquehmKV/c5aNwKy3Im1LAiGkUE8ANQCSTjJQfolsQc="
}
