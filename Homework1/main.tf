provider "aws" {
  profile = "default"
  region = "us-east-1"
}
resource "aws_instance" "grandpa-web" {
	count = var.instance_count
	ami = lookup(var.ami,var.aws_region)
	instance_type = var.instance_type
	tags = {
	  Name = element(var.instance_tags, count.index)
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

ebs_block_device {
  device_name           = var.ebs_device_name
  volume_size           = var.ebs_volume_size
  volume_type           = var.ebs_volume_type
  delete_on_termination = var.ebs_volume_delete_on_termination
  encrypted             = var.ebs_volume_encrypted
}
  
root_block_device {
  volume_type           = var.root_volume_type
  volume_size           = var.root_volume_size
  delete_on_termination = var.root_volume_delete_on_termination
  encrypted             = var.root_volume_encrypted
}
