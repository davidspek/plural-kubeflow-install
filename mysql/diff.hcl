metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
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

  sha = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
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

  sha = "c00c15ea470babc9762042426ec5df1fa9dd643545984c6eee544951e55bee22"
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

  sha = "h1:P7ioCC5/iwRMdnAGQEvfb6DQwsIrUo8HhOf8xsCnfKw="
}
