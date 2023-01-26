output "rabbitmq_password" {
	value = module.secrets.rabbitmq_password
	sensitive = true
}


output "rabbitmq_username" {
	value = module.secrets.rabbitmq_username
	sensitive = true
}


output "redis_password" {
	value = module.secrets.redis_password
	sensitive = true
}


