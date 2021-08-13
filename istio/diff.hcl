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

  sha = "937efc786961b442e374ed226ca7c05f881ca7b139e0b5085b16c22474702f82"
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

  sha = "h1:LA46q1HyHHSg3pkdPUCbQom5ctuuEW2uT/Twv+RQJIo="
}
