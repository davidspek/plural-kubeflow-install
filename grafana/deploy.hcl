metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8aV8xBuTovDwdcwX0YazTPj+sipOLNP2ubI1XKUr874="
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:8aV8xBuTovDwdcwX0YazTPj+sipOLNP2ubI1XKUr874="
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana",
  ]

  sha = "h1:8aV8xBuTovDwdcwX0YazTPj+sipOLNP2ubI1XKUr874="
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "a46827e35cbb6de69d23e95850bb154ba6d18c7aea0cfff14a24ecc628060fda"
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha = "h1:wgyMLwGSup8qy/rJHY4WFvrThMHRl14EEmpPUKKRgtQ="
}
