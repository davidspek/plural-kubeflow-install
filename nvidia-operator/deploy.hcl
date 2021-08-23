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

  sha = "fe0ac1ff33b25e59c47481e4585bc63587d5fdc49133baef840e0c8e203edac3"
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

  sha = "h1:+OEZOIXWgyp63i0M+AqBR3F8ldp5UNtXiNw2yqUjI8g="
}
