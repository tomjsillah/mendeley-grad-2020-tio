resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.Re-cares.id
  subnet_ids = [aws_subnet.grad-private-1.id, aws_subnet.grad-private-2.id]

  tags = {
    "Name"        = "acl_private"
    "Description" = "acl_private"
  }
}

# Authorize all inbound traffic.
resource "aws_network_acl_rule" "allow_ingress_all" {
  egress         = false
  protocol       = "all"
  rule_number    = 100
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  network_acl_id = aws_network_acl.private.id
}

# Authorize all outbound traffic.
resource "aws_network_acl_rule" "allow_egress_all" {
  egress         = true
  protocol       = "all"
  rule_number    = 100
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  network_acl_id = aws_network_acl.private.id
}

#--------------------------------------------------------------
# Public Subnet Network ACL
#--------------------------------------------------------------
resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.Re-cares.id
  subnet_ids = [aws_subnet.grad-public-1.id, aws_subnet.grad-public-1.id]

  tags = {
    "Name"        = "acl_public"
    "Description" = "acl_public"
  }
}

#--------------------------------------------------------------
# Public Subnet Network ACL - Ingress Rules
#--------------------------------------------------------------
resource "aws_network_acl_rule" "allow_ingress_http" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "allow_ingress_https" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "allow_ingress_icmp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 300
  egress         = false
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = -1
  to_port        = -1
  icmp_type      = -1
  icmp_code      = -1
}

resource "aws_network_acl_rule" "allow_ingress_ntp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 350
  egress         = false
  protocol       = "udp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 123
  to_port        = 123
}

resource "aws_network_acl_rule" "allow_ingress_ssh_vpc" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 800
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_ingress_smtps" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 810
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 465
  to_port        = 465
}

resource "aws_network_acl_rule" "allow_ingress_esmtp_rfc6409" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 820
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 587
  to_port        = 587
}

resource "aws_network_acl_rule" "block_ingress_rdp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 900
  egress         = false
  protocol       = "tcp"
  rule_action    = "deny"
  cidr_block     = "0.0.0.0/0"
  from_port      = 3389
  to_port        = 3389
}

resource "aws_network_acl_rule" "block_ingress_mssql" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 1000
  egress         = false
  protocol       = "tcp"
  rule_action    = "deny"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1433
  to_port        = 1433
}

resource "aws_network_acl_rule" "allow_ingress_udp_ephemeral" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 1500
  egress         = false
  protocol       = "udp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_ingress_tcp_ephemeral" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 1600
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

#--------------------------------------------------------------
# Public Subnet Network ACL - Egress Rules
#--------------------------------------------------------------
resource "aws_network_acl_rule" "allow_egress_tcp_ephemeral" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 101
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_egress_udp_ephemeral" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 110
  egress         = true
  protocol       = "udp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_egress_http" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "allow_egress_https" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 300
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "allow_egress_ssh_vpc" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 400
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_egress_icmp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 500
  egress         = true
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = -1
  to_port        = -1
  icmp_type      = -1
  icmp_code      = -1
}

resource "aws_network_acl_rule" "allow_egress_ntp" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 550
  egress         = true
  protocol       = "udp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 123
  to_port        = 123
}


resource "aws_network_acl_rule" "allow_egress_ssh_all" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 700
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_egress_smtps" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 800
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 465
  to_port        = 465
}

resource "aws_network_acl_rule" "allow_egress_esmtp_rfc6409" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 900
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 587
  to_port        = 587
}

