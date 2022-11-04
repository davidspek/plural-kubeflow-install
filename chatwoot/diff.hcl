metadata {
  path = "chatwoot"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Dt5RVeN7bHhGEvJW1jMMwHzwQ8tK7n3SEyQzg7FPg3c="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "chatwoot",
  ]

  sha     = "h1:Dt5RVeN7bHhGEvJW1jMMwHzwQ8tK7n3SEyQzg7FPg3c="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "chatwoot",
  ]

  sha     = "130a95b9f7ad287a6092e17cffd9de2e50c805aa78d8bbbc50d391902225f9ab"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "chatwoot/helm"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "chatwoot",
  ]

  sha     = "h1:qM9YgYITWmq+T3R5l5LF2y4ttNR88xOgKy5kmrOcT48="
  retries = 0
  verbose = false
}
