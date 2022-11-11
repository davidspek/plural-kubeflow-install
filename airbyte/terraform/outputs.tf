output "secret_access_key" {
	value = module.aws.secret_access_key
	sensitive = true
}


output "access_key_id" {
	value = module.aws.access_key_id
	sensitive = true
}


