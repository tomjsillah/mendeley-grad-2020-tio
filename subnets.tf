resource "aws_subnet" "grad-public-1" {
  vpc_id            = aws_vpc.Re-cares.id
   cidr_block        = "192.168.0.0/18"
  availability_zone = "us-east-2a"
   tags = {
     Name = "grad-public-1"
   }
 }

 resource "aws_subnet" "grad-private-1" {
  vpc_id            = aws_vpc.Re-cares.id
   cidr_block        = "192.168.128.0/18"
  availability_zone = "us-east-2a"
   tags = {
     Name = "grad-private-1"
     "kubernetes.io/cluster/eks_cluster" = "shared"
     "kubernetes.io/role/internal-elb"   = "1"
   }
 }

 resource "aws_subnet" "grad-public-2" {
  vpc_id            = aws_vpc.Re-cares.id
   cidr_block        = "192.168.64.0/18"
  availability_zone = "us-east-2b"
   tags = {
     Name = "grad-public-2"
   }
 }

 resource "aws_subnet" "grad-private-2" {
  vpc_id            = aws_vpc.Re-cares.id
   cidr_block        = "192.168.192.0/18"
  availability_zone = "us-east-2b"
   tags = {
     Name = "grad-private-2"
     "kubernetes.io/cluster/eks_cluster" = "shared"
    "kubernetes.io/role/internal-elb"   = "1"
   }
 }


