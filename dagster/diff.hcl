metadata {
  path = "dagster"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "dagster",
  ]

  sha     = "h1:gat+6BHp0rmt8vCE+lNY1bIY0Ozqx/4Zvlar8iqZep0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "dagster"
  target  = "dagster/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dagster",
  ]

  sha     = "ca6e50c3c68888128f895f3415881069151d2b012a4bbf823540b42d719e64df"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "dagster/helm"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dagster",
  ]

  sha     = "h1:87rnoNfUObSoSV0P55dplmBa0O5ovBOpCLn/WTLuN4w="
  retries = 0
  verbose = false
}
