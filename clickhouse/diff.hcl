metadata {
  path = "clickhouse"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "clickhouse",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "clickhouse"
  target  = "clickhouse/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "clickhouse",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "clickhouse/helm"
  target  = "clickhouse/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "clickhouse",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
