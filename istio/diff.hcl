metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha = "6c73c8fc87cec7e94b83df3fe453f5cbd4b38b7c0bfcda189fdea3264a3a8653"
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha = "h1:r9ly6xaoCS1IyOdJnbk82R/cIjTMsCGQK6FGNCrnSRA="
}
