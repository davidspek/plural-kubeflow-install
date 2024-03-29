metadata {
  path = "jitsu"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "jitsu",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "jitsu"
  target  = "jitsu/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "jitsu",
  ]

  sha     = "c4c1d59c97803c25553a3dfaff1c5d854f9f58e8a19975fd482847e569e75e87"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "jitsu/helm"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "jitsu",
  ]

  sha     = "h1:l++0b24CDJTHPN9696d4RK2WWtwCSvZMAQ97rKaAmcU="
  retries = 0
  verbose = false
}
