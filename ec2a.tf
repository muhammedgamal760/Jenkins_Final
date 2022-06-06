resource "aws_instance" "ec2a" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jimmyyy.key_name
  subnet_id              = module.network.public_subnet_one_id
  vpc_security_group_ids = [aws_security_group.security_group_one.id]
  provisioner "local-exec"{
        command = "echo the server ip address is ${self.public_ip}"
  }
  depends_on = [
    module.network.nat1,
    module.network.jimmy_public_route_association_one
  ]
user_data              = <<EOF
#!/bin/bash
sudo -i
apt update -y
apt install awscli -y
mkdir ~/.aws
touch ~/.aws/credentials
touch ~/.aws/config
echo -e "[default] \naws_access_key_id = AKIAV7K5UILDW4DF44QJ  \naws_secret_access_key = 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 " >> ~/.aws/credentials
echo -e "[default] \nregion = ${var.region} " >> ~/.aws/config
aws secretsmanager get-secret-value --secret-id jimmyy-ssm --query 'SecretString' --output text > ~/private.pem
aws ec2 describe-key-pairs --key-name jimmyyy --output text > ~/public.pem
chmod 400 ~/private.pem
EOF 
}


