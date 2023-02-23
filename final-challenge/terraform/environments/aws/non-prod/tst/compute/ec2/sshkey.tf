// ssh keypair


resource "aws_key_pair" "ssh-key" {
  key_name   = var.keyname
  public_key = file("../../../../../../keypair/bootcamp-final.pub")
  provider   = aws.bootcamp-tst
}


