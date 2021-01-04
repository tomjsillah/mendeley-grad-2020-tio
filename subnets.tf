resource "aws_subnet" "grad-public-1" {
  vpc_id            = aws_vpc.grad20.id
   cidr_block        = "192.168.0.0/18"
  availability_zone = "us-east-2a"
   tags = {
     Name = "grad-public-1"
   }
 }

 resource "aws_subnet" "grad-private-1" {
  vpc_id            = aws_vpc.grad20.id
   cidr_block        = "192.168.128.0/18"
  availability_zone = "us-east-2a"
   tags = {
     Name = "grad-private-1"
   }
 }

 resource "aws_subnet" "grad-public-2" {
  vpc_id            = aws_vpc.grad20.id
   cidr_block        = "192.168.64.0/18"
  availability_zone = "us-east-2b"
   tags = {
     Name = "grad-public-2"
   }
 }

 resource "aws_subnet" "grad-private-2" {
  vpc_id            = aws_vpc.grad20.id
   cidr_block        = "192.168.192.0/18"
  availability_zone = "us-east-2b"
   tags = {
     Name = "grad-private-2"
   }
 }


