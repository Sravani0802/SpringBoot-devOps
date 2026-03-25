module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "21.15.1"

    name               = "demo-alb-cluster"
    kubernetes_version = "1.33"

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    endpoint_public_access = true
    endpoint_private_access = true
    enable_irsa = true
    enable_cluster_creator_admin_permissions = true

    addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
    
    }

    eks_managed_node_groups = {
        demo-nodegroup = {
            ami_type = "AL2023_x86_64_STANDARD"
            instance_types = ["t3.small"]
            min_size = 2
            max_size = 6
            desired_size = 2
            node_role_arn        = aws_iam_role.eks_node_role.arn
            vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
            
        }
    }
    
    tags = {
    Environment = "dev"
    Name        = "demo"
  }


}

