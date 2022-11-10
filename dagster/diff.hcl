metadata {
  path = "dagster"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "dagster",
  ]

  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "dagster"
  target  = "dagster/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dagster",
  ]

  sha     = "1f46642807d7f4f42fb2a8f35046e26a1e88236a33c6db431c36640614625bbc"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "dagster/helm"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dagster",
  ]

  sha     = "h1:P6OhFfrJZS8Nqqh83gGnXLv8eqytXVkkv51+8ZizVjQ="
  retries = 0
  verbose = false
}
