resource "aws_eip" "eip" {
  vpc = true

  tags = merge(
    {
      "Name"        = "eip_nat"
      "Description" = "eip_nat"
    }
  )
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.grad-public-1.id
  depends_on    = [aws_internet_gateway.gw, aws_eip.eip, aws_subnet.grad-public-1]

  tags = merge(
    {
      "Name"        = "nat_gateway"
      "Description" = "nat_gateway"
    }
  )
}

resource "aws_eip" "eip_2" {
  vpc = true

  tags = merge(
    {
      "Name"        = "eip_nat_2"
      "Description" = "eip_nat_2"
    }
  )
}

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.grad-public-2.id
  depends_on    = [aws_internet_gateway.gw, aws_eip.eip_2, aws_subnet.grad-public-2]

  tags = merge(
    {
      "Name"        = "nat_gateway_2"
      "Description" = "nat_gateway_2"
    },
  )
}