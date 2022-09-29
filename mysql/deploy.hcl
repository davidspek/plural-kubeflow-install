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

  sha     = "h1:g/Dl5yNp95Mql8lD7DiCxQt2eZHwiG9PuqHPbkTUV3g="
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

  sha     = "h1:g/Dl5yNp95Mql8lD7DiCxQt2eZHwiG9PuqHPbkTUV3g="
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

  sha     = "h1:g/Dl5yNp95Mql8lD7DiCxQt2eZHwiG9PuqHPbkTUV3g="
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

  sha     = "0972124c1aeffb435fe1dbae1240ba63f4eb114faba6002702dbf5801c1a715f"
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

  sha     = "h1:u3tsDhe5kR1OfOt4ACe+4b9K35uqraq81X9wV5Pt5yY="
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

  sha     = "h1:06LR7U+3xc77V92uWuLVC6897k1tNPzjwt7u5cysFXA="
  retries = 2
  verbose = false
}
