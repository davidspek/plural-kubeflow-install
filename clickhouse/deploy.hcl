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

  sha     = "10fa8d6caf2ae3466158be4a5762f8d567946350e0c25d6377142988ea52b81d"
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

  sha     = "h1:D4T052Ib5Y1uauHUhePP3cjxyN9JtY+MSt/v0HXopzE="
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

  sha     = "h1:qv42OVAznOmu9J+GJXOx1NBUkYPMg6nKwL9PBqGQtwo="
  retries = 2
  verbose = false
}
