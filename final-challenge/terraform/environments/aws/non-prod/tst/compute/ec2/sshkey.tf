// ssh keypair


resource "aws_key_pair" "ssh-key" {
  key_name   = var.keyname
  public_key = var.key_pair_pub
  provider   = aws.bootcamp-tst
}


