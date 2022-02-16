metadata {
  path = "kyverno"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kyverno/terraform"
  target  = "kyverno/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:b6k+v89lBb4yNhTe6DPQ7jn2HIPc4K8wDFJwZT8U36g="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kyverno/terraform"
  target  = "kyverno/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:b6k+v89lBb4yNhTe6DPQ7jn2HIPc4K8wDFJwZT8U36g="
  retries = 1
}

step "terraform-output" {
  wkdir   = "kyverno"
  target  = "kyverno/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kyverno",
  ]

  sha     = "h1:b6k+v89lBb4yNhTe6DPQ7jn2HIPc4K8wDFJwZT8U36g="
  retries = 0
}

step "kube-init" {
  wkdir   = "kyverno"
  target  = "kyverno/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e036e8c379384b940e88d0b4eacf5143792932311a05ce2c6061862ebf58f22d"
  retries = 0
}

step "crds" {
  wkdir   = "kyverno"
  target  = "kyverno/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kyverno",
  ]

  sha     = "h1:ZTOraiD+ckM6BtxMPhoOpn23BczsuYU2GXMBJ7OVvsU="
  retries = 0
}

step "bounce" {
  wkdir   = "kyverno"
  target  = "kyverno/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kyverno",
  ]

  sha     = "h1:AHCwktzRYAxwy8HUlhkdIqzYNdY9aL3ZTAu2PlJ6+4Y="
  retries = 1
}
