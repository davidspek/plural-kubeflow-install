metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
  retries = 0
}

step "terraform" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "knative",
  ]

  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
  retries = 0
}

step "kube-init" {
  wkdir   = "knative"
  target  = "knative/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "knative",
  ]

  sha     = "6e8eb2d7117cfabff0007c40384fb1bf0c600f1cfc911ed72227bb8fe0cbd79a"
  retries = 0
}

step "helm" {
  wkdir   = "knative/helm"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "knative",
  ]

  sha     = "h1:34Sj5jFsbBtbSh85ohjtQWNEs00dvkyRWkEOB08RW0w="
  retries = 0
}
