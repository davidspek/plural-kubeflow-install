metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3NdahvEyoE7ahOBJ18ZKiMhLu18lgCeWWPDM8NClDJw="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:3NdahvEyoE7ahOBJ18ZKiMhLu18lgCeWWPDM8NClDJw="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "f644ff21eb46ce7a5ed2d7bdb8867af85ef798338fbe51fac0e98850f55e63cf"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:W60/+ZthVWHKEUvH4Jxg+a2M0rhxYR9cBA5lM7y+LtE="
  retries = 0
}
