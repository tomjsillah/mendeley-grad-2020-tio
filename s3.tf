# resource "aws_s3_bucket" "bucket" {
#   bucket = "re-cares-backend"

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = false
#   }

#   tags = {
#     Name = "S3 remote tfstate store"
#   }
# }