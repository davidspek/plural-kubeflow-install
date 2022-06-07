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

  sha     = "h1:Wek0w5tFzYwdRJrHqTYqvRjUMjbsPDdiQFOSK7p3JTk="
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

  sha     = "h1:Wek0w5tFzYwdRJrHqTYqvRjUMjbsPDdiQFOSK7p3JTk="
  retries = 1
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

  sha     = "h1:Wek0w5tFzYwdRJrHqTYqvRjUMjbsPDdiQFOSK7p3JTk="
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

  sha     = "de4bbd841ada0adced2e828a20e865770ae26299db543f43f139d8b80bf43c00"
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
  retries = 1
  verbose = false
}
