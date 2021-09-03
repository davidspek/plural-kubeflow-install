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

  sha = "d9e0453cdc5be378cd9fa3e0e857cbdd678f53c98eb451dff6c4dbe854fecefe"
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

  sha = "h1:tWs9DuoD5kfC63EkwaseyxDGbvM6HpiQxDeBRyoVhNQ="
}
