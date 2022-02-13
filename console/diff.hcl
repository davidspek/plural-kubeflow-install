metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Do8tuEGHq22vWehvQ3vI9GFQ7UaVG+1VhnxUHv70Oz0="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:Do8tuEGHq22vWehvQ3vI9GFQ7UaVG+1VhnxUHv70Oz0="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "f0c2d4bf87c273ed246cbbf19407bba927c6fe3af620ce3b556e30ec1fb3566f"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:Df1u2EN/2ZN7sH9JKjGKoeNk2cqJGD/cL1mbyGoebnU="
  retries = 0
}
