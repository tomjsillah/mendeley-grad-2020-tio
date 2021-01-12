#--------------------------------------------------------------
# Routing tables for private subnets
#--------------------------------------------------------------
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.Re-cares.id
  tags = {
    "Name"        = "private_route"
    "Description" = "private_routes"
  }
}
resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.Re-cares.id
  tags = {
    "Name"        = "private_route_2"
    "Description" = "private_routes"
  }
}
#--------------------------------------------------------------
# Routes for private routing table
#--------------------------------------------------------------
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
resource "aws_route" "private_route_2" {
  route_table_id         = aws_route_table.private_route_table_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_2.id
}
#--------------------------------------------------------------
# Associations between private subnets and route tables
#--------------------------------------------------------------
# resource "aws_route_table_association" "private_rta" {
#   subnet_id      = aws_subnet.grad-private-1.id
#   route_table_id = aws_route_table.private_route_table.id
# }
# resource "aws_route_table_association" "private_rta_2" {
#   subnet_id      = aws_subnet.grad-private-2.id
#   route_table_id = aws_route_table.private_route_table_2.id
# }
#--------------------------------------------------------------
# Routing tables for public subnets
#--------------------------------------------------------------
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.Re-cares.id
  tags = {
    "Name"        = "public_route"
    "Description" = "public_routes"
  }
}
resource "aws_route_table" "public_route_table_2" {
  vpc_id = aws_vpc.Re-cares.id
  tags = {
    "Name"        = "public_route_2"
    "Description" = "public_routes"
  }
}
#--------------------------------------------------------------
# Routes for public routing table
#--------------------------------------------------------------
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
resource "aws_route" "public_route_2" {
  route_table_id         = aws_route_table.public_route_table_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
#--------------------------------------------------------------
# Associations between public subnets and route tables
#--------------------------------------------------------------
# resource "aws_route_table_association" "public_rta" {
#   subnet_id      = aws_subnet.grad-public-1.id
#   route_table_id = aws_route_table.public_route_table.id
# }
# resource "aws_route_table_association" "public_rta_2" {
#   subnet_id      = aws_subnet.grad-public-2.id
#   route_table_id = aws_route_table.public_route_table_2.id
# }

