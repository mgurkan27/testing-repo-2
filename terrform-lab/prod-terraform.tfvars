instance_type = "t3.micro"
key_name      = "my-key"
env_type      = "prod" 
ec2_tags      = { 
  Name = "terraform-example"
  Environment = "prod"
}
