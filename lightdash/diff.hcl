metadata {
  path = "lightdash"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Ifguwq2v6He3anUO30dcMsLhbIsBjy8P85DYqonpcVM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "lightdash",
  ]

  sha     = "8c7704a5548d45a43affd397fad89514160ad1022ce6445b74cf41149b5dff0f"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "lightdash/helm"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "lightdash",
  ]

  sha     = "h1:/29UeP570Z0LQ8DlKoDmJLe/Y0dX45Qb9hkHEBqus7s="
  retries = 0
  verbose = false
}
