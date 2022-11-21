output "rabbitmq_password" {
	value = module.kube.rabbitmq_password
	sensitive = true
}


output "rabbitmq_username" {
	value = module.kube.rabbitmq_username
	sensitive = true
}


