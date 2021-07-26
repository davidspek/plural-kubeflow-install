metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
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

  sha = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
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

  sha = "04050caf0a4f6e81f6a8dd68c8bc664b473ee4f4f6ec2e7786c84472abdee621"
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

  sha = "h1:qiib2RIqtoICDOXh4xeeF0obMh5iCEbfPisvCkeqn6o="
}
