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

  sha     = "0246c53774f863734d166b5a3d04fb717d0f8dda65b73182d908d9f478bdfc02"
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

  sha     = "h1:/hMrS6ssAe6anmswFr22xnh+DEo3kvwpxiNrcpQCvPk="
  retries = 0
  verbose = false
}
