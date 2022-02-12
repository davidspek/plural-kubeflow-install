metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3ju6U/uq64IAyJ8DT8L16XIKe/7M1Ekxf05gK6FWGVo="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:3ju6U/uq64IAyJ8DT8L16XIKe/7M1Ekxf05gK6FWGVo="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "2dc1b46f00f4ee7e416d216f3054d0577f91fedc3ca5868679f8c942444f43f5"
  retries = 0
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:YOYbpjhs7NbCwhclIlYU2yTYRn7q1xGRj/sjnsP9lxA="
  retries = 0
}
