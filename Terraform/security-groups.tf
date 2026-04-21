resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id = module.vpc.vpc_id 

  tags = {
    "Name" = "all_worker_mgmt"
  }
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  description = "allow inbound traffic from eks"
  from_port = 0
  protocol = "-1"
  to_port = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type = "ingress"
  cidr_blocks = [
    "10.0.0.0/16",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

resource "aws_security_group_rule" "all_worker_mgmt_engress" {
  description = "allow outbound traffic to anywhere"
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.all_worker_mgmt.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

data "aws_iam_policy_document" "eks_node_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"
  assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role.json
}



resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}