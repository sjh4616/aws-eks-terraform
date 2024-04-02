resource "aws_s3_bucket" "project00-s3-tf-state" {

  bucket = "project00-s3-tf-state"

  tags = {
    "Name" = "project00-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "project00-ddb-lock-table" {

  depends_on   = [aws_s3_bucket.project00-s3-tf-state]
  name         = "project00-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "project00-lock-table"
  }

}