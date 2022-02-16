terraform {
  backend "s3" {
    bucket = "kubeflow-dev-tf-state"
    key = "kubeflow-dev/bootstrap/terraform.tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.5.0"
    }
    # kubectl = {
    #   source  = "gavinbunney/kubectl"
    #   version = ">= 1.7.0"
    # }
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_eks_cluster" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# provider "kubectl" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
#   load_config_file       = true
# }


module "aws-bootstrap" {
  source = "./aws-bootstrap"

### BEGIN MANUAL SECTION <<aws-bootstrap>>

### END MANUAL SECTION <<aws-bootstrap>>


  vpc_name = "kubeflow-dev"
  cluster_name = "kubeflow-dev"
  
  map_roles = [
    {
      rolearn = "arn:aws:iam::332124921534:role/kubeflow-dev-console"
      username = "console"
      groups = ["system:masters"]
    }
  ]

}


module "aws-efs" {
  source = "./aws-efs"

### BEGIN MANUAL SECTION <<aws-efs>>

### END MANUAL SECTION <<aws-efs>>


  cluster_name = module.aws-bootstrap.cluster_name
  vpc_name = "kubeflow-dev"
  namespace = "bootstrap"
  cluster_worker_private_subnets = module.aws-bootstrap.cluster_worker_private_subnets
  cluster_worker_private_subnet_ids = module.aws-bootstrap.cluster_worker_private_subnet_ids
  

}
