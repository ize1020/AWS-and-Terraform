provider "aws" {
  profile = "default"
  region = "us-east-1"
}
resource "aws_instance" "grandpa-web" {
ami = "ami-04505e74c0741db8d"
instance_type ="t3.micro"
tags = {
  Name = "isaac.grandpa.whiskey2"
 }
 key_name = "ZOHAR"
  user_data = <<EOF
#!/bin/bash -xe
sudo apt-get install nginx -y
sudo chmod 777 /var/www/html/index.nginx-debian.html
sudo echo 'Welcome to Grandpa's Whiskey' >/var/www/html/index.nginx-debian.html
sudo service nginx restart
EOF
}

#step 2
#create a resource from EBS volume in same AZ as os1
resource "aws_ebs_volume" "ebs2"{
 availability_zone = aws_instance.grandpa-web.availability_zone
 size = 10
 encrypted = true
 tags = {
  Name = "Extra_EBS"
 }
}


#step 3 
#attach volume
resource "aws_volume_attachment" "attach_ebs_2"{
device_name = "/dev/sdh"
volume_id = aws_ebs_volume.ebs2.id
instance_id =aws_instance.grandpa-web.id
}
