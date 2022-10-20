metadata {
  path = "lightdash"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "lightdash"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "lightdash",
  ]

  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "lightdash"
  target  = "lightdash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8c7704a5548d45a43affd397fad89514160ad1022ce6445b74cf41149b5dff0f"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "lightdash"
  target  = "lightdash/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "lightdash",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "lightdash"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "lightdash",
  ]

  sha     = "h1:/29UeP570Z0LQ8DlKoDmJLe/Y0dX45Qb9hkHEBqus7s="
  retries = 2
  verbose = false
}
