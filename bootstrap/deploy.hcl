metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:zs6aFot2bxuGBeBLaVJpD7Dd8BxzS5HgM+ktS1+e70o="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:zs6aFot2bxuGBeBLaVJpD7Dd8BxzS5HgM+ktS1+e70o="
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha = "h1:zs6aFot2bxuGBeBLaVJpD7Dd8BxzS5HgM+ktS1+e70o="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "9b275242ecee4f39f152b868452dae3c08a06548ac933416f16b302d80c1a3d4"
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha = "h1:7FdY7EQzLud8Ibr90WeuMDc/WYeGqxdvj85wM+8PEBU="
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha = "h1:Cks/apU40COK9mpSw256hjlwLLF1kHH512d76OfNa4Q="
}
