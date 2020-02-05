# First example file
provider "aws" {
   profile    = "kirans"
   region     = "us-east-1"
   access_key = "DUMMY"
   secret_key = "DUMMY"
 }

resource "aws_security_group" "kiransgroup" {
  name = "mytask-sg"
  ingress{
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    TeamName = "Capg India Team"
	Project = "RSAProject"
        Name = "kiransecurity"
  }
}

resource "aws_instance" "first_tesrraform_ec2" {
   ami = "ami-04763b3055de4860b"
   instance_type = "t2.micro"
   key_name = "devops"
   user_data = <<-EOF
		#! /bin/bash
                sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Hello From `hostname -i`</h1>" | sudo tee /var/www/html/index.html
	EOF
   tags = {
     Name = "Kiran_terra"
     Project = "DevOps"
   }
   security_groups = ["mytask-sg"]
}
