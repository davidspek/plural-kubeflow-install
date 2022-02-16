terraform {
  backend "s3" {
    bucket = "kubeflow-dev-tf-state"
    key = "kubeflow-dev/kubeflow/terraform.tfstate"
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


  
  namespace = "kubeflow"
  pipelines_bucket = "kubeflow-dev-pipelines-new"
  cluster_name = "kubeflow-dev"
  node_role_arn = "arn:aws:iam::332124921534:role/kubeflow-dev20211011090633019200000009"
  private_subnets = yamldecode(<<EOT
  - arn: arn:aws:ec2:us-east-2:332124921534:subnet/subnet-0a23766cd87835a28
    assign_ipv6_address_on_creation: false
    availability_zone: us-east-2a
    availability_zone_id: use2-az1
    cidr_block: 10.0.16.0/20
    customer_owned_ipv4_pool: ""
    id: subnet-0a23766cd87835a28
    ipv6_cidr_block: ""
    ipv6_cidr_block_association_id: ""
    map_customer_owned_ip_on_launch: false
    map_public_ip_on_launch: false
    outpost_arn: ""
    owner_id: "332124921534"
    tags:
      Name: kubeflow-dev-worker-private-us-east-2a
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    tags_all:
      Name: kubeflow-dev-worker-private-us-east-2a
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    timeouts: null
    vpc_id: vpc-0bc4ac6db35345f38
  - arn: arn:aws:ec2:us-east-2:332124921534:subnet/subnet-0c96966797a2eddde
    assign_ipv6_address_on_creation: false
    availability_zone: us-east-2b
    availability_zone_id: use2-az2
    cidr_block: 10.0.32.0/20
    customer_owned_ipv4_pool: ""
    id: subnet-0c96966797a2eddde
    ipv6_cidr_block: ""
    ipv6_cidr_block_association_id: ""
    map_customer_owned_ip_on_launch: false
    map_public_ip_on_launch: false
    outpost_arn: ""
    owner_id: "332124921534"
    tags:
      Name: kubeflow-dev-worker-private-us-east-2b
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    tags_all:
      Name: kubeflow-dev-worker-private-us-east-2b
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    timeouts: null
    vpc_id: vpc-0bc4ac6db35345f38
  - arn: arn:aws:ec2:us-east-2:332124921534:subnet/subnet-09bd3d2e748e04a99
    assign_ipv6_address_on_creation: false
    availability_zone: us-east-2c
    availability_zone_id: use2-az3
    cidr_block: 10.0.48.0/20
    customer_owned_ipv4_pool: ""
    id: subnet-09bd3d2e748e04a99
    ipv6_cidr_block: ""
    ipv6_cidr_block_association_id: ""
    map_customer_owned_ip_on_launch: false
    map_public_ip_on_launch: false
    outpost_arn: ""
    owner_id: "332124921534"
    tags:
      Name: kubeflow-dev-worker-private-us-east-2c
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    tags_all:
      Name: kubeflow-dev-worker-private-us-east-2c
      kubernetes.io/cluster/kubeflow-dev: shared
      kubernetes.io/role/internal-elb: "1"
    timeouts: null
    vpc_id: vpc-0bc4ac6db35345f38
  
  EOT
  )
  

}
