metadata {
  path = "oauth2-proxy"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform-apply" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform-output" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "oauth2-proxy",
  ]

  sha = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "kube-init" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "566c77e2f65e8d8036d2b8abad6adb9c4a8de1d3ac3525b9eddd8b8390485934"
}

step "crds" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "oauth2-proxy",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "oauth2-proxy"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "oauth2-proxy",
  ]

  sha = "h1:+B77/d7RbnvpLOwcO9hngX3Mo7OekHIem8g82U6bz9A="
}
