metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:PBPs6S8qDS6gcp7vhIbRTygSk9aFn0n5s1+42wOfW1U="
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha = "h1:PBPs6S8qDS6gcp7vhIbRTygSk9aFn0n5s1+42wOfW1U="
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha = "90017fc405c9b36e4930626fd38ed3d9920784134324b6688d6da0e9821c3e7f"
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha = "h1:we6caDHzdz3RvR1A6T8PP/R7819ZfvSgG3bDEtMNW+0="
}
