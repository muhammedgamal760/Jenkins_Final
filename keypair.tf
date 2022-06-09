resource "tls_private_key" "tls" {
  algorithm = "RSA"
}

resource "aws_key_pair" "jimmyyy" {
  key_name   = "jimmyyy"
  public_key = tls_private_key.tls.public_key_openssh
  tags = {
    Name = "jimmyyy"
  }
}
resource "aws_secretsmanager_secret" "jimmy-s" {
  name = "jimmy-s"
}

resource "aws_secretsmanager_secret_version" "jimmy-smv" {
  secret_id     = aws_secretsmanager_secret.jimmy-s.id
  secret_string = tls_private_key.tls.private_key_pem
}

resource "local_file" "private_key" {
  depends_on = [
    tls_private_key.tls,
  ]
  content  = tls_private_key.tls.private_key_pem
  filename = "private.pem"
} 

