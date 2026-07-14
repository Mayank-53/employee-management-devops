output "alb_sg_id" {

  value = aws_security_group.alb.id
}

output "eks_node_sg_id" {

  value = aws_security_group.eks_nodes.id
}

output "postgres_sg_id" {

  value = aws_security_group.postgres.id
}
