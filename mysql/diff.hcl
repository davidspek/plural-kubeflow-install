metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:B4GBhQaRdoxV3jvk7zIQrFXtJqhT/XAmJCSu8YebkuU="
  retries = 0
}

step "terraform" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mysql",
  ]

  sha     = "h1:B4GBhQaRdoxV3jvk7zIQrFXtJqhT/XAmJCSu8YebkuU="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha     = "e691bee490944914674aaf64d71da1b6225c523d98be61593de856140c3ba174"
  retries = 0
}

step "helm" {
  wkdir   = "mysql/helm"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mysql",
  ]

  sha     = "h1:/6eDpxrl3h2ttyuqGZy8gGSzMGGGEYTqO1ZQJhXM1FE="
  retries = 0
}
