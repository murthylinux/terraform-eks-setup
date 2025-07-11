resource "aws_instance" "maven_server" {
  ami                    = var.ami_id
  instance_type          = var.maven_instance_type
  subnet_id              = aws_subnet.vc_public[0].id
  vpc_security_group_ids = [aws_security_group.viking_sg.id]
  key_name               = aws_key_pair.vikingcloud.key_name
  user_data              = file("${path.module}/scripts/install_maven.sh")

  tags = {
    Name = "maven-server"
  }
}
