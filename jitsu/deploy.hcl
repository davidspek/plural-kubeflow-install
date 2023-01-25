metadata {
  path = "jitsu"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "jitsu"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "c4c1d59c97803c25553a3dfaff1c5d854f9f58e8a19975fd482847e569e75e87"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "jitsu"
  target  = "jitsu/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "jitsu",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "jitsu"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "jitsu",
  ]

  sha     = "h1:l++0b24CDJTHPN9696d4RK2WWtwCSvZMAQ97rKaAmcU="
  retries = 2
  verbose = false
}
