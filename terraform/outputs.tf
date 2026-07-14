output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_security_group" {

  value = module.security_groups.alb_sg_id
}

output "eks_node_security_group" {

  value = module.security_groups.eks_node_sg_id
}

output "postgres_security_group" {

  value = module.security_groups.postgres_sg_id
}
output "backend_ecr_repository" {

  value = module.ecr.backend_repository_url

}

output "frontend_ecr_repository" {

  value = module.ecr.frontend_repository_url

}
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}
