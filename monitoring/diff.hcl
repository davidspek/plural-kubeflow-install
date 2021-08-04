metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha = "0892f85f9fc1aec64305e4778a48bbfab4fb07086586057b478331497e8c64c1"
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha = "h1:UwsdEenQdGUbnys0bcwTLVXzlvrGBGuzz9sNCumEAy4="
}
