metadata {
  path = "clickhouse"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:A/hMv2IMxZysXp+fym+RvnaXkc21LXlhEGwyLukmb60="
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

  sha     = "h1:A/hMv2IMxZysXp+fym+RvnaXkc21LXlhEGwyLukmb60="
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

  sha     = "10fa8d6caf2ae3466158be4a5762f8d567946350e0c25d6377142988ea52b81d"
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

  sha     = "h1:qv42OVAznOmu9J+GJXOx1NBUkYPMg6nKwL9PBqGQtwo="
  retries = 0
  verbose = false
}
