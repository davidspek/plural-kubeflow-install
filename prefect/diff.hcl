metadata {
  path = "prefect"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lIiH0wFhr7RsSeoNmvOYDvLrGgsETw2YkqyDR9XAf8Y="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "prefect",
  ]

  sha     = "h1:lIiH0wFhr7RsSeoNmvOYDvLrGgsETw2YkqyDR9XAf8Y="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "prefect"
  target  = "prefect/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "prefect",
  ]

  sha     = "94e5eaee0838137adb7122b3c7d6db761a25159389393b44554a73e284f93bb0"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "prefect/helm"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "prefect",
  ]

  sha     = "h1:WelcbCD2I13r6wTQC0/qPAZWC+SBVmgXhi1drQDsjcc="
  retries = 0
  verbose = false
}
