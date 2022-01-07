metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
  retries = 0
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
  retries = 0
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "e9904be56ece1ca06fad5615fcd6a8a4ee609d83573d09bbce1ab14f69b2c33b"
  retries = 0
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:26nfcix4Hev2Jd35T3dvP9gfoPNwP46OpUBjyyiFtzU="
  retries = 0
}
