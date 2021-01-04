resource "aws_route_table_association" "public_rta" {
 subnet_id = aws_subnet.grad-public-1.id
   route_table_id = aws_route_table.grad-public-rt-1.id
 }

 resource "aws_route_table_association" "public_rta_2" {
 subnet_id = aws_subnet.grad-public-2.id
   route_table_id = aws_route_table.grad-public-rt-2.id
 }

 resource "aws_route_table_association" "private_rta" {
 subnet_id = aws_subnet.grad-private-1.id
   route_table_id = aws_route_table.grad-private-rt-1.id
 }

 resource "aws_route_table_association" "private_rta_2" {
 subnet_id = aws_subnet.grad-private-2.id
   route_table_id = aws_route_table.grad-private-rt-2.id
 }


