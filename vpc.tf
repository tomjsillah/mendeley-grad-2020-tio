resource "aws_vpc" "Re-cares" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "Re-cares"
  }
}