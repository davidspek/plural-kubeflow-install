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
  retries = 0
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

  sha     = "h1:pZRWSHbUF3D38OiovVluqR3LuLIwKNMAEb1Ii+9Vn6Q="
  retries = 0
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

  sha     = "f929274ae5dc1b8501a7a534076318687409a3bd7b2f78be7cb23b54e9381c44"
  retries = 0
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

  sha     = "h1:loPwnPi04nE8K44Pigrdruk0HpRbDIsyMqR3cOEmgo8="
  retries = 0
}
