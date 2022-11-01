metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "8e37840c74334ca5280e2a147b01b5d8d9fc2d26944f8297aa628c92b734523d"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:+NsihTmRdJ7RhftFZLJ+IjcpG9iutbYvoRUuxai0j9Y="
  retries = 0
  verbose = false
}
