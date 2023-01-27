output "node_groups" {
	value = module.aws-bootstrap.node_groups
	sensitive = true
}


output "vpc" {
	value = module.aws-bootstrap.vpc
	sensitive = true
}


output "cluster_public_subnet_ids" {
	value = module.aws-bootstrap.cluster_public_subnet_ids
	sensitive = true
}


output "cluster_private_subnet_ids" {
	value = module.aws-bootstrap.cluster_private_subnet_ids
	sensitive = true
}


output "cluster_worker_private_subnet_ids" {
	value = module.aws-bootstrap.cluster_worker_private_subnet_ids
	sensitive = true
}


output "endpoint" {
	value = module.aws-bootstrap.cluster_endpoint
	sensitive = true
}


output "cluster" {
	value = module.aws-bootstrap.cluster
	sensitive = true
}


output "cluster_public_subnets" {
	value = module.aws-bootstrap.cluster_public_subnets
	sensitive = true
}


output "cluster_service_ipv4_cidr" {
	value = module.aws-bootstrap.cluster_service_ipv4_cidr
	sensitive = true
}


output "worker_role_arn" {
	value = module.aws-bootstrap.worker_role_arn
	sensitive = true
}


output "cluster_private_subnets" {
	value = module.aws-bootstrap.cluster_private_subnets
	sensitive = true
}


output "cluster_worker_private_subnets" {
	value = module.aws-bootstrap.cluster_worker_private_subnets
	sensitive = true
}


output "vpc_cidr" {
	value = module.aws-bootstrap.vpc_cidr
	sensitive = true
}


output "cluster_oidc_issuer_url" {
	value = module.aws-bootstrap.cluster_oidc_issuer_url
	sensitive = true
}


