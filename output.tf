output "instance_public_id" {
    description = "the public IP address of the EC"
    value = aws_instance.NginxServe.public_ip
   
}

output "instance_url" {
    description = "The URL to access the Nginx servers"
    value = "http://${aws_instance.NginxServe.public_ip}"
  
}