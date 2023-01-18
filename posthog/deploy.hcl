metadata {
  path = "posthog"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:v+wLmHfR6txc2/1ramGZH6gEsuQC3XnnE0nOikjyQuw="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "posthog"
  target  = "posthog/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "d6112979a39553dcc143d5f71f659606451d10bc846994373621d9ae0904efd7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "posthog"
  target  = "posthog/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "posthog",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "posthog"
  target  = "posthog/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "posthog",
  ]

  sha     = "h1:bYg+x+YcI2nQsQV/1UWFWcuRrT3uj1QIQO81VG3N+io="
  retries = 2
  verbose = false
}
