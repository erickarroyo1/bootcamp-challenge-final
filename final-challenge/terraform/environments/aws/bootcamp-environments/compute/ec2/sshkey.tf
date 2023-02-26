// ssh keypair


resource "aws_key_pair" "ssh-key" {
  key_name   = "${var.keyname}-${terraform.workspace}"
  public_key = file("../../../../../../terraform/keypair/bootcamp-final.pub")
  provider   = aws.bootcamp
}


