resource "aws_route_table" "grad-public-rt-1" {
  vpc_id = aws_vpc.Re-cares.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
   }

   tags = {
     Name = "grad-public-rt-1"
   }
 }

 resource "aws_route_table" "grad-public-rt-2" {
  vpc_id = aws_vpc.Re-cares.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
   }

   tags = {
     Name = "grad-public-rt-2"
   }
 }

 resource "aws_route_table" "grad-private-rt-1" {
  vpc_id = aws_vpc.Re-cares.id
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
   }

   tags = {
     Name = "grad-private-rt-1"
   }
 }

  resource "aws_route_table" "grad-private-rt-2" {
  vpc_id = aws_vpc.Re-cares.id
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_2.id
   }

   tags = {
     Name = "grad-private-rt-2"
   }
 }

