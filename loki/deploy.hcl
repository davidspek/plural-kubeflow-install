metadata {
  path = "loki"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:YTc8Kod9x2KHt5ULbI5o0I9JLPcMvjtLQouMy92VK+I="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:YTc8Kod9x2KHt5ULbI5o0I9JLPcMvjtLQouMy92VK+I="
  retries = 1
}

step "terraform-output" {
  wkdir   = "loki"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "loki",
  ]

  sha     = "h1:YTc8Kod9x2KHt5ULbI5o0I9JLPcMvjtLQouMy92VK+I="
  retries = 0
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "fac14214dcacae209f2e2d24f1ccbc81c0f3dfdf3a03980510a4cc043b21cebb"
  retries = 0
}

step "crds" {
  wkdir   = "loki"
  target  = "loki/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "loki",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "loki"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "loki",
  ]

  sha     = "h1:mlsgAIenpKmms8lRbMgMMy2qmtZha8ROzLBMXIyEph4="
  retries = 1
}
