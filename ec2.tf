resource "aws_instance" "NginxServe"{

    ami= "ami-0b6d9d3d33ba97d99"
    instance_type = "t3.micro"

    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
    associate_public_ip_address = true
    user_data_replace_on_change = true


    user_data = <<-EOF
      #!/bin/bash
      set -e
      apt-get update -y
      DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
      systemctl enable --now nginx
      EOF


    tags = {
      Name =" NginxServer"
    } 
}
