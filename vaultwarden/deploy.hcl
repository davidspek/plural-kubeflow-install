metadata {
  path = "vaultwarden"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
  retries = 1
}

step "terraform-output" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "vaultwarden",
  ]

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
  retries = 0
}

step "kube-init" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7d620809e676cc69d71c3cdae4f91aa2e417e607121fc70b3bd1e701a878a027"
  retries = 0
}

step "crds" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vaultwarden",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vaultwarden",
  ]

  sha     = "h1:WfgIPTTIUP8Qp3uxU2HIt4XYRRFzltH4J+A6Erk9t3o="
  retries = 1
}
