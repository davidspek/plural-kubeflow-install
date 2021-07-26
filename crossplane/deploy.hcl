metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha = "h1:EVuJcAA7WuJRXVU1CIcPLtDQQyXIfFsk2B+ENtAEtn4="
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha = "h1:qiib2RIqtoICDOXh4xeeF0obMh5iCEbfPisvCkeqn6o="
}
