variable "image_id" {
  description = "This variable contains image id"
  type        = string
  default     = "ami-09d95fab7fff3776c"
}

variable "instance_type" {
    type = string
    description = "This is my instanc type"
    default = "t2.micro"
}


variable "password" {
    type = string
    description = "This is my instanc type"
}

