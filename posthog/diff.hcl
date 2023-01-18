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

  sha     = "d6112979a39553dcc143d5f71f659606451d10bc846994373621d9ae0904efd7"
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

  sha     = "h1:bYg+x+YcI2nQsQV/1UWFWcuRrT3uj1QIQO81VG3N+io="
  retries = 0
  verbose = false
}
