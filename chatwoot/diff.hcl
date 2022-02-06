metadata {
  path = "chatwoot"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OWBs+tXlhX+u5d+DzZeLy4jgUC0VFjge58R1hch6JWY="
  retries = 0
}

step "terraform" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "chatwoot",
  ]

  sha     = "h1:OWBs+tXlhX+u5d+DzZeLy4jgUC0VFjge58R1hch6JWY="
  retries = 0
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "chatwoot",
  ]

  sha     = "f4e678e70276433ee9a621de8fd165c98b78d205b4324e456ee8c1d62335dae3"
  retries = 0
}

step "helm" {
  wkdir   = "chatwoot/helm"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "chatwoot",
  ]

  sha     = "h1:N1ostTkhppEoxBEkrEVfKvMFAILNGv8bVJMfDT+saDs="
  retries = 0
}
