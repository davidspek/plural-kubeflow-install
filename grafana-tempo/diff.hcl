metadata {
  path = "grafana-tempo"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:JdR0pCjUDbEhmYQkmB+NEnafW2oV7XNqMK18bCBqDsA="
  retries = 0
  verbose = false
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

  sha     = "h1:JdR0pCjUDbEhmYQkmB+NEnafW2oV7XNqMK18bCBqDsA="
  retries = 0
  verbose = false
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

  sha     = "f0b0f986c55d1815c32df398c4d9769a9f9783ddbc3859335c0c8572c55b6b56"
  retries = 0
  verbose = false
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

  sha     = "h1:j3Qsoc07VUIvdHiZ9G/0O0j7tmTlxGvcFLq4XnhGyuw="
  retries = 0
  verbose = false
}
