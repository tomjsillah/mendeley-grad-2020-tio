resource "aws_security_group" "grad20_SG" {
  name        = "grad20_SG"
  description = "Allow inbound HTTP from Elsevier IP ranges"
  vpc_id      = aws_vpc.Re-cares.id

  tags = {
    "Name"        = "eks-cluster-sg-Re-cares-project-150331860"
  }
}

resource "aws_security_group_rule" "allow_http_from_elsevier" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["192.168.0.0/18"]
  security_group_id = aws_security_group.grad20_SG.id
}

resource "aws_security_group" "https_grad20_SG" {
  name        = "https_grad20_SG"
  description = "Allow inbound HTTPS from Elsevier IP ranges"
  vpc_id      = aws_vpc.Re-cares.id

  tags = {
    "Name"        = "eks-cluster-sg-Re-cares-project-150331860"
  }
}

resource "aws_security_group_rule" "allow_https_from_elsevier" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["192.168.128.0/18"]
  security_group_id = aws_security_group.https_grad20_SG.id
}