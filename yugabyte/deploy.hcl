metadata {
  path = "yugabyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "yugabyte"
  target  = "yugabyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "yugabyte",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "yugabyte"
  target  = "yugabyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "11528fd75aef7348635b82449d1384ab203210abcc64697d85b04babcf44903a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "yugabyte"
  target  = "yugabyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "yugabyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "yugabyte"
  target  = "yugabyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "yugabyte",
  ]

  sha     = "h1:6AOYpsoLwe9z1kfpDLved3ulBOaEVMqhPkvnyVd3UBU="
  retries = 1
  verbose = false
}
