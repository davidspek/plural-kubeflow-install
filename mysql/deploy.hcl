metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:3b4H+RonYfxx01aLoes9uwv7/jqguFzm9+gUJaSx05c="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:3b4H+RonYfxx01aLoes9uwv7/jqguFzm9+gUJaSx05c="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mysql",
  ]

  sha     = "h1:3b4H+RonYfxx01aLoes9uwv7/jqguFzm9+gUJaSx05c="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9ca27e77ca9ee50b6ea4e702c365450f3fef9794bfa8894f9fd683330cf49f5d"
  retries = 0
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha     = "h1:uNJ+QzJsx9nBbinejxqtfpphNDus5Iv4NgnqVvJYKi4="
  retries = 0
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha     = "h1:td2VtR/YtutXWviDt8GI/HpKIYALixwKzdO0l1p/TW0="
  retries = 1
}
