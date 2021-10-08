metadata {
  path = "goldilocks"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:T1lS6Tn3thjxpyeF2M8MqjWEP7VrXQtSj8uylAmiIyw="
  retries = 0
}

step "terraform" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "goldilocks",
  ]

  sha     = "h1:T1lS6Tn3thjxpyeF2M8MqjWEP7VrXQtSj8uylAmiIyw="
  retries = 0
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "goldilocks",
  ]

  sha     = "81db8dfb7254660d370c2bdef3f88b2cbd405363763ecc3be2305ba74b9eaf57"
  retries = 0
}

step "helm" {
  wkdir   = "goldilocks/helm"
  target  = "goldilocks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "goldilocks",
  ]

  sha     = "h1:aMfhqKvk1YrHFMsN0ID5skNQeOpn6klWyo5N2sZ+4WM="
  retries = 0
}
