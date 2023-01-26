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

  sha     = "h1:6kt6l+cDgvA8dk34QxOfz8TVVsZJdFkoyLsjZWZvyuU="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:6kt6l+cDgvA8dk34QxOfz8TVVsZJdFkoyLsjZWZvyuU="
  retries = 2
  verbose = false
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

  sha     = "h1:6kt6l+cDgvA8dk34QxOfz8TVVsZJdFkoyLsjZWZvyuU="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1cb915c3e1f4b72da0a6986f166b825295265b9c0f3cb0579205014e1c39bdb6"
  retries = 0
  verbose = false
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

  sha     = "h1:T1lIla5g/soUFflyXkgCTT0HkgyFbquWvOhNI2frBco="
  retries = 0
  verbose = false
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

  sha     = "h1:FAQNvZw5kUJCMqNwL6DxgSyKqfI4w0Au7Z/SA4L3pW4="
  retries = 2
  verbose = false
}
