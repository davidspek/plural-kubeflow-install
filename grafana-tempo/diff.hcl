metadata {
  path = "grafana-tempo"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vvkchEznI3mVEE78mMhrgv//kQs+/DYT8k1eaHm0PQY="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana-tempo",
  ]

  sha     = "h1:vvkchEznI3mVEE78mMhrgv//kQs+/DYT8k1eaHm0PQY="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana-tempo",
  ]

  sha     = "73ba87e8982700f5ffb22e497ac30caa39e0d44565346439379500756bfdb053"
  retries = 0
}

step "helm" {
  wkdir   = "grafana-tempo/helm"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana-tempo",
  ]

  sha     = "h1:K37Rl0Fax4KVlPexNAHMGsFZ7B94it0CBo5Xtmzq66Y="
  retries = 0
}
