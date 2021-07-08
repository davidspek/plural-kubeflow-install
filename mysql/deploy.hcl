metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Rd3cHcMWVgPW0WfQC3rSWt0DsXLbUNjLABP6UqldnHM="
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Rd3cHcMWVgPW0WfQC3rSWt0DsXLbUNjLABP6UqldnHM="
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

  sha = "h1:Rd3cHcMWVgPW0WfQC3rSWt0DsXLbUNjLABP6UqldnHM="
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha = "cebd05ac1333d3803098c98ad3d2a58de9781ea09eaac21f19df561c57566454"
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

  sha = "h1:uNJ+QzJsx9nBbinejxqtfpphNDus5Iv4NgnqVvJYKi4="
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

  sha = "h1:zfHV5Dn+jlX9UKURQLv0LY4XI/CmZnfb7HyNpi1rXUk="
}
