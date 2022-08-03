metadata {
  path = "metabase"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:f6cZlaQ3J+ehJ327fjC4C7yyiNyX8y5y0eoMZ8ZsQDk="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "metabase",
  ]

  sha     = "d2647ca8fb2e0c554c03aa668dfa0c0773cee9010e639b80542ec58476d030fb"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "metabase/helm"
  target  = "metabase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "metabase",
  ]

  sha     = "h1:8AgEv6k6oUQYtK5E/pAdP80kZpuuREx8Lr9AddgHNhM="
  retries = 0
  verbose = false
}
