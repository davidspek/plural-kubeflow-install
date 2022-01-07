metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:DV7QI4RhpZbUMkGXx1+Pe02JsCgGEzYAfjcoMj2wtho="
  retries = 0
}

step "terraform" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubecost",
  ]

  sha     = "h1:DV7QI4RhpZbUMkGXx1+Pe02JsCgGEzYAfjcoMj2wtho="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubecost",
  ]

  sha     = "88f9dfb07d1840ddff48cfccc6d7f32ae3cf3fcc89d91f24dfead96ecf3ba22a"
  retries = 0
}

step "helm" {
  wkdir   = "kubecost/helm"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubecost",
  ]

  sha     = "h1:Wr29A/jUtmLmFu+BD4QwXhjlXrOvi1lrZs4CTdYaV1s="
  retries = 0
}
