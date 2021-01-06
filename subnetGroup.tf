resource "aws_db_subnet_group" "Re-cares" {
  name       = "re-cares"
  subnet_ids = [aws_subnet.grad-public-1.id, aws_subnet.grad-private-2.id]

  tags = {
    Name = "Re-cares subnet group"
  }
}