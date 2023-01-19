metadata {
  path = "posthog"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lyLJHE4L0IffmCqnTtiVrD73J2rJ/LZ18bW3cND7fpM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "posthog",
  ]

  sha     = "h1:lyLJHE4L0IffmCqnTtiVrD73J2rJ/LZ18bW3cND7fpM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "posthog"
  target  = "posthog/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "posthog",
  ]

  sha     = "b76fc683f78f91be3c4761c86a9df5a7f918329f41b7a6e672b7e9fa1180c9a4"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "posthog/helm"
  target  = "posthog/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "posthog",
  ]

  sha     = "h1:nSa644pSCOlH9RTEd6nQkiOy0he24YKaK/5VlvHROAk="
  retries = 0
  verbose = false
}
