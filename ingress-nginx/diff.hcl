metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MFJqz4ZDbNAwXnWcm/lYNKWsup+J/JuON4dsYWgSDco="
  retries = 0
}

step "terraform" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ingress-nginx",
  ]

  sha     = "h1:MFJqz4ZDbNAwXnWcm/lYNKWsup+J/JuON4dsYWgSDco="
  retries = 0
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ingress-nginx",
  ]

  sha     = "1d8bd5eb8df09493de414c93d3748111fee1f07685a1bc2f9ca4a3c215e5a279"
  retries = 0
}

step "helm" {
  wkdir   = "ingress-nginx/helm"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ingress-nginx",
  ]

  sha     = "h1:BEoVjjoTBxoUqxFJxeSzc6kU6Dux0JufAYneCgD1hMk="
  retries = 0
}
