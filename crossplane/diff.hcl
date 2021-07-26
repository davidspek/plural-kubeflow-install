metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8bVZ6nXhOjPs8V2TfR9Ng/r4W/0aqfvVc4M28oMQIbk="
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha = "h1:8bVZ6nXhOjPs8V2TfR9Ng/r4W/0aqfvVc4M28oMQIbk="
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha = "b9e94b979eec2ddba6970763ab3b17c28164930d1e71da6ad8af45f7903acfd7"
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha = "h1:YeE4sW9aRhDSwAKIG4KGRB4fFyt2HDRPAIU+ppiL5vg="
}
