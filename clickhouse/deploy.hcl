metadata {
  path = "clickhouse"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:A/hMv2IMxZysXp+fym+RvnaXkc21LXlhEGwyLukmb60="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "clickhouse"
  target  = "clickhouse/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "2c7e1e6a9bb128f31e8bc7427f17d9d7ffab9668f5894a569e4eb0a9b7ce8bd4"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "clickhouse"
  target  = "clickhouse/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "clickhouse",
  ]

  sha     = "h1:F4dI4lB0ANAQp8UcY8+yP7Lw0xMWX6jZaoOES7VaMkU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "clickhouse"
  target  = "clickhouse/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "clickhouse",
  ]

  sha     = "h1:mhGq7PtIV+gk/l3ieN97Rv5gKQqt5qMmYy+ALzbGKFU="
  retries = 2
  verbose = false
}
