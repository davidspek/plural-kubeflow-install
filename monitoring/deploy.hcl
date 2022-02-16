metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:E8ITD1O+opyFymnV0mw5pdO8VbhQd4CLw6tG8vm0WuA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:E8ITD1O+opyFymnV0mw5pdO8VbhQd4CLw6tG8vm0WuA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:E8ITD1O+opyFymnV0mw5pdO8VbhQd4CLw6tG8vm0WuA="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0d55769a3760e92057b62e4f6a3bf58862fd7ea66ec9f7d898112c12fb5f106d"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:E82vY6TK15PNCfsRyWSRy/BN+rYx2ZI+dK0AmWQb47M="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:6bC4PldOP29/pPJsWBVwGsQ5EfDxlbSQKTzNhO9YNgA="
  retries = 1
}
