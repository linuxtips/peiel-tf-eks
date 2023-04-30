
# Create a VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("vpc_%s_%s_%s_001", var.app, var.region, var.env)
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("igw_%s_%s_%s_001", var.app, var.region, var.env)
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Create subnets
resource "aws_subnet" "main" {
  count                   = length(var.subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("subnet_%s_%s_%s_00%s", var.app, var.region, var.env, count.index)
  }
}

data "aws_subnets" "main" {
  depends_on = [aws_subnet.main]
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = format("subnetdb_%s_%s_%s_001", var.app, var.region, var.env)
  subnet_ids = data.aws_subnets.main.ids

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("subnetdb_%s_%s_%s_001", var.app, var.region, var.env)
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("rt_%s_%s_%s_001", var.app, var.region, var.env)
  }
}

resource "aws_route_table_association" "main" {
  depends_on     = [aws_route_table.main, data.aws_subnets.main]
  count          = length(var.subnets)
  subnet_id      = tolist(data.aws_subnets.main.ids)[count.index]
  route_table_id = aws_route_table.main.id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = format("k8s_%s_%s_%s_001", var.app, var.region, var.env)
  cluster_version = var.eks_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = aws_vpc.main.id
  subnet_ids = data.aws_subnets.main.ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.default_instance_size
  }

  eks_managed_node_groups = {
    blue = {
      min_size     = var.ng_min_size
      max_size     = var.ng_max_size
      desired_size = var.ng_desired_size
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_accounts = var.aws_account

  tags = {
    app         = var.app
    environment = var.env
    region      = var.region
    Name        = format("k8s_%s_%s_%s_001", var.app, var.region, var.env)
  }
}
