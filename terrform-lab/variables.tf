variable "image_id" {
  description = "This variable contains image id"
  type        = string
  default     = "ami-09d95fab7fff3776c"
}

variable "instance_type" {
  type        = string
  description = "This is my instanc type"
}


variable "key_name" {
  type        = string
  description = "Name of ssh key"
}

variable "ec2_tags" {
  type = map
}

variable "env_type" {
  type = string
}

