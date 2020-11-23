resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance
  key_name               = aws_key_pair.key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    name = var.name
  }
  associate_public_ip_address = var.enable_public_ip
}

resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC11wJ2tsWrawDkgDDfOwPsuqJIUrfp/bVBIVWGLd6rFfccYLokYhstlRnhbHoWzThlOoJjPWrwmIfrx3f4+0XjCWmOYY6xMM1jzzjPASW/TLyIvDj3HoqXxdoRI7wqodrSsc2pO2mnhT/MAXk5KYm8QIZ7/TCL/3tYnOSAnePRx0F2Xn/vj8iRwPmDWyBbIbH1rP1f9n+IM8j9Hi3lccP+WRIgIX5eLQaWi32OGHjieh1Rm4Agz0JFhP9W27+sEd7QYw+3dYve38HDS9+fgTYs5g+WLg9LrnIJ1bExfhxFYEgkjKapEe5ieVCtcnzJ2vg5GvnTLbcYhEwDNXbq9z7f shaker_abdul@gke-controller"
}
