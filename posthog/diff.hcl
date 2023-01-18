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

  sha     = "h1:v+wLmHfR6txc2/1ramGZH6gEsuQC3XnnE0nOikjyQuw="
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

  sha     = "h1:v+wLmHfR6txc2/1ramGZH6gEsuQC3XnnE0nOikjyQuw="
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

  sha     = "f84b87288809d3857573df77d976fd037aeac16f0a85b2d92ff333148ac08056"
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

  sha     = "h1:y89xrxGuVfydu1UsIRcTOo6oX6ObON+gQyf3QpiSR04="
  retries = 0
  verbose = false
}
