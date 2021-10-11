metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:pmRacuhbGEi4HNT43zMONWbBq/qMToRtJVxJK7/WuRI="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:pmRacuhbGEi4HNT43zMONWbBq/qMToRtJVxJK7/WuRI="
  retries = 1
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redis",
  ]

  sha     = "h1:pmRacuhbGEi4HNT43zMONWbBq/qMToRtJVxJK7/WuRI="
  retries = 0
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "c8dd9e16e5383b903c4eda8c88be718788ad5d3f71a617cb25f4c7b159c8afb3"
  retries = 0
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha     = "h1:8oXKYamBrp++7vJJEmSzjR+6nvYFyPZ93nWt9q5+1Eo="
  retries = 1
}
