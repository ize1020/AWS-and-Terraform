rovider "aws" {
  profile = "default"
  region = "us-east-1"
}
resource "aws_instance" "isaac-lab" {
ami = "ami-04505e74c0741db8d"
instance_type ="t3.micro"
tags = {
  Name = "isaac.grandpa.whiskey2"
 }
 key_name = "ZOHAR"
  user_data = <<EOF
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt update -y
sudo amazon-linux-extras install nginx1 -y
sudo su -c "/bin/echo 'Welcome to Grandpa's Whiskey' >/usr/share/nginx/html/index.html"
sudo systemctl start nginx
sudo systemctl enable  nginx
EOF
}

#step 2
#create a resource from EBS volume in same AZ as os1
resource "aws_ebs_volume" "ebs1"{
 availability_zone = aws_instance.isaac-lab.availability_zone
 size = 10
 encrypted = true
 tags = {
  Name = "Extra_EBS"
 }
}


#step 3 
#attach volume
resource "aws_volume_attachment" "attach_ebs_1"{
device_name = "/dev/sdh"
volume_id = aws_ebs_volume.ebs1.id
instance_id =aws_instance.isaac-lab.id
