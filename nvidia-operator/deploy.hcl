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

  sha = "4c03696d68b952723a5dfb4fdd13bebf53e64bef98b9e85d3f63a60bf52ddca5"
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
