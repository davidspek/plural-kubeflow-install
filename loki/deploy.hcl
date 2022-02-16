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

  sha     = "d342d5c81d15cd90dbf5bac26331a3759897c8be669c5934e6eb020597018eef"
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
