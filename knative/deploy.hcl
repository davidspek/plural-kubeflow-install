metadata {
  path = "knative"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Q10b2oSQyLZ0RIRchjit+Ofd8kSAMzJ6FctQg2+ANzI="
}

step "terraform-apply" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Q10b2oSQyLZ0RIRchjit+Ofd8kSAMzJ6FctQg2+ANzI="
}

step "terraform-output" {
  wkdir   = "knative"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "knative",
  ]

  sha = "h1:Q10b2oSQyLZ0RIRchjit+Ofd8kSAMzJ6FctQg2+ANzI="
}

step "kube-init" {
  wkdir   = "knative"
  target  = "knative/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "e54318768c204774d8329ec0a6cd7486aab962ad76e5d4d114035aa39b8f0c16"
}

step "crds" {
  wkdir   = "knative"
  target  = "knative/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "knative",
  ]

  sha = "h1:s8JMuUzcwBd9InBgKkeHP467cORHWvP4P/hu+Oh7fVI="
}

step "bounce" {
  wkdir   = "knative"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "knative",
  ]

  sha = "h1:vpGq6WngMdfLbuXJ4c8fuHBQQP2sCDXZCD2ugk2yHCo="
}
