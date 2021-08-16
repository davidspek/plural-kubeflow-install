output "s3_access_secret" {
	value = module.aws.s3_access_secret
	sensitive = true
}


output "s3_access_key" {
	value = module.aws.s3_access_key
	sensitive = true
}


