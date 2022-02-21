ariable "ami" {
  type = map

  default = {
    "us-east-1" = "ami-04505e74c0741db8d"
    "us-east-1" = "ami-04505e74c0741db8d"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_tags" {
  type = list
  default = ["grandpa-1", "grandpa-2"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_region" {
  default = "us-east-1"
}


variable "root_volume_encrypted" {
  type        = bool
  default     = false
}

variable "ebs_device_name" {
  description = "The name of the ebs volume. For example /dev/sdb"
  type        = bool
  default     = "/dev/sdb"
}

variable "ebs_volume_size" {
  description = "The size, in GB, of the ebs EBS volume."
  type        = bool
  default     = 10
}

variable "ebs_volume_type" {
  type        = gp2
  default     = "standard"
}

variable "ebs_volume_delete_on_termination" {
  type        = bool
  default     = true
}

variable "ebs_volume_encrypted" {
  type        = bool
  default     = true
}
