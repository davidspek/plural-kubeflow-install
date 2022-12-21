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

  sha     = "93ada57593343c4a70efd331fa8e4f0e2f1097261bc3280df29c5b4671142ef5"
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

  sha     = "h1:jOC09ZjBX9wkXWOxf6c+9Ba04eaWORy1a4RT2UmxbBQ="
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

  sha     = "h1:iM7K2ySTK4JJHgMIZ5ufKfRcxth/0xfyt6Kq8Msza+k="
  retries = 2
  verbose = false
}
