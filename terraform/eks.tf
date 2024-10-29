module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.16"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_addons                  = var.cluster_addons
  eks_managed_node_groups         = var.eks_managed_node_groups
  tags = var.tags
}
