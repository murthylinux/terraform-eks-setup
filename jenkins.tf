resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = var.jenkins_instance_type
  subnet_id              = aws_subnet.vc_public[0].id
  vpc_security_group_ids = [aws_security_group.viking_sg.id]
  key_name               = aws_key_pair.vikingcloud.key_name
  user_data              = file("${path.module}/scripts/install_jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }
}


resource "aws_instance" "jenkins_agent" {
  ami                    = var.ami_id
  instance_type          = var.jenkins_instance_type
  subnet_id              = aws_subnet.vc_public[0].id
  vpc_security_group_ids = [aws_security_group.viking_sg.id]
  key_name               = aws_key_pair.vikingcloud.key_name
  user_data              = file("${path.module}/scripts/install_jenkins.sh")

  tags = {
    Name = "jenkins-agent"
  }
}
