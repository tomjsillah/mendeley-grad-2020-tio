resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Re-cares.id
  tags = {
    Name = "Re-cares-IGW"
  }
}