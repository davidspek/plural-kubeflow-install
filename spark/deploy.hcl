metadata {
  path = "spark"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:n4cRJIT5ArqpTKn53MdTt2G/jXILUCUyP/sNSN0pSrY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:n4cRJIT5ArqpTKn53MdTt2G/jXILUCUyP/sNSN0pSrY="
  retries = 1
}

step "terraform-output" {
  wkdir   = "spark"
  target  = "spark/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "spark",
  ]

  sha     = "h1:n4cRJIT5ArqpTKn53MdTt2G/jXILUCUyP/sNSN0pSrY="
  retries = 0
}

step "kube-init" {
  wkdir   = "spark"
  target  = "spark/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9b8fc390fb3a90eaec03adaae73ca05cf1f53a36d103a74be29cc41093ce6c8d"
  retries = 0
}

step "crds" {
  wkdir   = "spark"
  target  = "spark/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "spark",
  ]

  sha     = "h1:jLHHyrynCMz6i/CLZbNOyXgdM2ZQaS1hJwn+GHTHoyo="
  retries = 0
}

step "bounce" {
  wkdir   = "spark"
  target  = "spark/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "spark",
  ]

  sha     = "h1:NcX2beMsDNeKNCA/5RvqjNtfpBI2drKVQJtBTsUs8J8="
  retries = 1
}
