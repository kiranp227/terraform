output "publicaddress" {
    description = "This is to grab public ip of instance"
    value = aws_instance.first_tesrraform_ec2.public_ip
}
