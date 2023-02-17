#remote state s3 bucket


resource "aws_s3_bucket" "terraform_tlz-bootcamp_state" {
  bucket = var.bucket-name
  # Enable versioning so we can see the full revision history of our
  # state files

  tags = merge(
    local.common_tags,
    {
      Name = var.bucket-name
    },
  )
  #define provider
  provider = aws.tlz-account
}

#enable versioning
resource "aws_s3_bucket_versioning" "tf-tlz-bootcamp-s3-versioning" {
  bucket = aws_s3_bucket.terraform_tlz-bootcamp_state.id
  versioning_configuration {
    status = "Enabled"
  }
  #define provider
  provider = aws.tlz-account
}

#kms key for bucket encryption

resource "aws_kms_key" "tf-tlz-bootcamp-security-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  tags = merge(
    local.common_tags,
    {
      Name = var.kms-name
    },
  )
  #define provider
  provider = aws.tlz-account
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ss3-tlz-bootcamp" {
  bucket = aws_s3_bucket.terraform_tlz-bootcamp_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tf-tlz-bootcamp-security-key.id
      sse_algorithm     = "aws:kms"
    }
  }
  #define provider
  provider = aws.tlz-account
}


#remote state dynamodb 

resource "aws_dynamodb_table" "terraform_tlz-bootcamp_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(
    local.common_tags,
    {
      Name = var.dynamodb_table_name
    },
  )
  #define provider
  provider = aws.tlz-account
}

