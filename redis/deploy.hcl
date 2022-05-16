metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:xaUlGS1mz9shNvh2LopGLaeuUPyYYUNzuE+KDl27xtE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:xaUlGS1mz9shNvh2LopGLaeuUPyYYUNzuE+KDl27xtE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redis",
  ]

  sha     = "h1:xaUlGS1mz9shNvh2LopGLaeuUPyYYUNzuE+KDl27xtE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "171025ce2cf89f876b6bfd609852d449c5bedc7e4ff1a51cd291b3ea7acd0228"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha     = "h1:YiSeoBBxWXSihwKDMOu4oPzHKrwmRQuFcNCY74V+7zc="
  retries = 1
  verbose = false
}
