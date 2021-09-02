metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:9zOCzGvm4hTewiZQ256zmmd2jCzeFV8mxDGbHuHJMQM="
}

step "terraform" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-cd",
  ]

  sha = "h1:9zOCzGvm4hTewiZQ256zmmd2jCzeFV8mxDGbHuHJMQM="
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-cd",
  ]

  sha = "dd2ee18352338f915bdc86898fa7c2b51b256f4fac875633f3067fa48998ecb5"
}

step "helm" {
  wkdir   = "argo-cd/helm"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-cd",
  ]

  sha = "h1:M//h45Oza09NFLU+uOwteKgbKECNv3umqEo3P99TnuA="
}
