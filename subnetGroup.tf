resource "aws_db_subnet_group" "grad20" {
  name       = "grad20"
  subnet_ids = [aws_subnet.grad-public-1.id, aws_subnet.grad-private-2.id]

  tags = {
    Name = "Our Grad20 subnet group"
  }
}