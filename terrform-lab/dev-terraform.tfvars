instance_type = "t2.micro"
key_name      = "my-key"
env_type      = "dev"
ec2_tags      = { 
  Name = "terraform-example"
  Environment = "dev"
}