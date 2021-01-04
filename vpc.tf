resource "aws_vpc" "grad20" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "grad20"
  }
}