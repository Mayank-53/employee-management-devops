module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  availability_zones = var.availability_zones
}

module "security_groups" {

  source = "./modules/security-groups"

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id
}

module "ecr" {

  source = "./modules/ecr"

  project_name = var.project_name

  environment = var.environment

}
module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "employee-management-eks"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  create_cloudwatch_log_group = true

  addons = {

    coredns = {}

    kube-proxy = {}

    vpc-cni = {
      before_compute = true
    }

    eks-pod-identity-agent = {
      before_compute = true
    }
    aws-ebs-csi-driver = {
      service_account_role_arn = aws_iam_role.ebs_csi.arn
    }

  }

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.public_subnet_ids

  eks_managed_node_groups = {

    default = {

      instance_types = ["t3.small"]

      capacity_type = "ON_DEMAND"

      min_size = 3

      max_size = 4

      desired_size = 3

      disk_size = 20

      ami_type = "AL2023_x86_64_STANDARD"

      labels = {

        role = "general"

      }

      update_config = {

        max_unavailable_percentage = 50

      }

    }

  }

  tags = {

    Project = var.project_name

    Environment = var.environment

    Terraform = "true"

  }

}
