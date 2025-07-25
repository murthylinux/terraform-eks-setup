resource "aws_key_pair" "vikingcloud" {
  key_name   = "vikingcloud-key"
  public_key = file("${path.module}/key_pair/vikingcloud-key.pub")
}

resource "aws_instance" "vikingcloud_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vc_public[0].id
  key_name                    = aws_key_pair.vikingcloud.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true



  tags = {
    Name = "vikingcloud-ec2"
  }
  lifecycle {
    prevent_destroy = true
  }

}


