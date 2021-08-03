metadata {
  path = "oauth2-proxy"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ah1458BqKjU+LHJBcuFV2CtwVVoBvV/3TpKe1c3AlCA="
}

step "terraform" {
  wkdir   = "oauth2-proxy/terraform"
  target  = "oauth2-proxy/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "oauth2-proxy",
  ]

  sha = "a3365140d8a2a784f28cf23ca7913ec56d8f9de02f617dbc5fd1494cd758ccda"
}

step "helm" {
  wkdir   = "oauth2-proxy/helm"
  target  = "oauth2-proxy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oauth2-proxy",
  ]

  sha = "h1:+B77/d7RbnvpLOwcO9hngX3Mo7OekHIem8g82U6bz9A="
}
