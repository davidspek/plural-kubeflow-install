metadata {
  path = "nvidia-operator"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:G9deUA4HeS1qnSiOCYFrzAXP3XhoKIjUsB3C2Niz3kU="
}

step "terraform-apply" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:G9deUA4HeS1qnSiOCYFrzAXP3XhoKIjUsB3C2Niz3kU="
}

step "terraform-output" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nvidia-operator",
  ]

  sha = "h1:G9deUA4HeS1qnSiOCYFrzAXP3XhoKIjUsB3C2Niz3kU="
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "d736cfc133cbe99cf2e0fd951ecaa2c1702e7137c372d1880de6c510f4b97cc9"
}

step "crds" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nvidia-operator",
  ]

  sha = "h1:hEajuUG/qDLGzXeB88VnlXSSlSXcYLJdMevhlQLB8oM="
}

step "bounce" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nvidia-operator",
  ]

  sha = "h1:F3+iVmoDAcgqwcJcPX3FzZTL/h/uVnJrHI70e9wRnd4="
}
