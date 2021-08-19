terraform {
	backend "s3" {
		bucket = "kubeflow-dev-tf-state"
		key = "kubeflow-dev/gitlab/terraform.tfstate"
		region = "us-east-2"
	}

	required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36.0"
    }
		kubernetes = {
			source  = "hashicorp/kubernetes"
			version = "~> 2.0.3"
		}
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_eks_cluster" "cluster" {
  name = "kubeflow-dev"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "kubeflow-dev"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


module "aws" {
  source = "./aws"

### BEGIN MANUAL SECTION <<aws>>

### END MANUAL SECTION <<aws>>


  cluster_name = "kubeflow-dev"
  namespace = "gitlab"
  registry_bucket = "kubeflow-dev-gitlab-registry"
  artifacts_bucket = "kubeflow-dev-gitlab-artifacts"
  packages_bucket = "kubeflow-dev-gitlab-packages"
  backups_bucket = "kubeflow-dev-gitlab-backups"
  backups_tmp_bucket = "kubeflow-dev-gitlab-tmp-backups"
  lfs_bucket = "kubeflow-dev-gitlab-lfs"
  uploads_bucket = "kubeflow-dev-gitlab-uploads"
  runner_cache_bucket = "kubeflow-dev-gitlab-runner-cache"

}
