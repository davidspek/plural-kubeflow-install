metadata {
  path = "test-harness"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "test-harness/terraform"
  target  = "test-harness/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:0j/uPKbBdO8/wzs7ZfOJXkhEH+kEoeEbasS00WaNHPU="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "test-harness/terraform"
  target  = "test-harness/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:0j/uPKbBdO8/wzs7ZfOJXkhEH+kEoeEbasS00WaNHPU="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "test-harness"
  target  = "test-harness/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "test-harness",
  ]

  sha     = "h1:0j/uPKbBdO8/wzs7ZfOJXkhEH+kEoeEbasS00WaNHPU="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "test-harness"
  target  = "test-harness/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6e1af61bf1ae9dd61be201c969913ce215d4cc05b82b5a0814cb240deabc9d17"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "test-harness"
  target  = "test-harness/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "test-harness",
  ]

  sha     = "h1:VhhVQiif612A/CPVSZzpFj5Xs/WAF121cwruYD4A4zM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "test-harness"
  target  = "test-harness/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "test-harness",
  ]

  sha     = "h1:9QLyG9UDV8kZCNxElu15e5DF9lBHJYfMR82whc5+H8w="
  retries = 1
  verbose = false
}
