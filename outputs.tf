output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = data.aws_subnets.main.ids
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_node_groups" {
  value = module.eks.eks_managed_node_groups
}