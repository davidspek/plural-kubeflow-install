metadata {
  path = "kubecost"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Zn/4UuO9PjtT2k2AOkgQ/GXcnbPym92OrZhvQ7SlEsI="
}

step "terraform-apply" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Zn/4UuO9PjtT2k2AOkgQ/GXcnbPym92OrZhvQ7SlEsI="
}

step "terraform-output" {
  wkdir   = "kubecost"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubecost",
  ]

  sha = "h1:Zn/4UuO9PjtT2k2AOkgQ/GXcnbPym92OrZhvQ7SlEsI="
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "4d907f5a4d688035a47505b3cca4eed5df1e15e8b632dbfcaeb5ed88cc1db685"
}

step "crds" {
  wkdir   = "kubecost"
  target  = "kubecost/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubecost",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "kubecost"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubecost",
  ]

  sha = "h1:lyCy7+VjETi2vDwglVfVwdi1MGly2a+XM7E3sEHJB50="
}
