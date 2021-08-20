metadata {
  path = "argo-cd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:oXu5GY93sxzNl2y524wyz1TCNXFRU8x1kbheIb5KmNw="
}

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:oXu5GY93sxzNl2y524wyz1TCNXFRU8x1kbheIb5KmNw="
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-cd",
  ]

  sha = "h1:oXu5GY93sxzNl2y524wyz1TCNXFRU8x1kbheIb5KmNw="
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "2730d0a19d6393aeb890140b4f5713a1c91d84b8592108a251a774b3d3d0b68b"
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha = "h1:C+IcOQPZtt5b7kOJR87hRIVvo49JEM2/oTRopzumeEM="
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha = "h1:aiFjOpD1yux4JkYg3F45d1L2VFO8FHdXvUHfAEFx7ic="
}
