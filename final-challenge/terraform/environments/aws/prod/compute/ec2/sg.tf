# Definir grupo de seguridad puerto 80 servidores
resource "aws_security_group" "grupo_seguridad" {
  name = "${var.app}-${var.env}-sg"
  #get vpc id from data.tf 
  vpc_id   = data.terraform_remote_state.vpc-tst.outputs.vpc_id
  provider = aws.bootcamp-tst
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 80"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 22"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "All trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}