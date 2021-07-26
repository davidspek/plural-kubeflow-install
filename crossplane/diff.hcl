metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:okykSMa9VgLztpM+9T3KLlswC8LWadK5wgsKf4M//i0="
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

  sha = "h1:okykSMa9VgLztpM+9T3KLlswC8LWadK5wgsKf4M//i0="
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

  sha = "5c6ef5f4bcd149e1aeb0f8b2b6dd8ca8d58d7cdae5a431d1e4587e6e8fa9a218"
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

  sha = "h1:uKFhyzBHNwA2hAHx+g0D+Lx4YU4cIPLv4kDTtR1Fg9Q="
}
