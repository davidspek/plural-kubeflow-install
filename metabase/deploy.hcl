metadata {
  path = "metabase"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:f6cZlaQ3J+ehJ327fjC4C7yyiNyX8y5y0eoMZ8ZsQDk="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:f6cZlaQ3J+ehJ327fjC4C7yyiNyX8y5y0eoMZ8ZsQDk="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "metabase"
  target  = "metabase/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "metabase",
  ]

  sha     = "h1:f6cZlaQ3J+ehJ327fjC4C7yyiNyX8y5y0eoMZ8ZsQDk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "metabase"
  target  = "metabase/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d2647ca8fb2e0c554c03aa668dfa0c0773cee9010e639b80542ec58476d030fb"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "metabase"
  target  = "metabase/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "metabase",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "metabase"
  target  = "metabase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "metabase",
  ]

  sha     = "h1:8AgEv6k6oUQYtK5E/pAdP80kZpuuREx8Lr9AddgHNhM="
  retries = 1
  verbose = false
}
