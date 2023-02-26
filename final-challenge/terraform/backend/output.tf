output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_tlz-bootcamp_state
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_tlz-bootcamp_locks
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_tlz-bootcamp_locks
  description = "The name of the DynamoDB table"
}