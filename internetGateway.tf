 resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.grad20.id
    tags = {
      Name = "re-cares-IGW"
    }
 }