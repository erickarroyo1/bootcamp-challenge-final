output "ssm_role" {
  value = aws_iam_role.iam-role.name
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.iam-profile.name

}


