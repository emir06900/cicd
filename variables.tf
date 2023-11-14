variable "instance_type" {
  default = "t2.micro"
}
 
variable "environment" {
  default = "DevOps"
}
 
variable "ec2_key" {
  default = "new-jenkins"
}
 
variable "ec2_iam_instance_profile" {
  default = "DevOps-emir_2023_ec2_profile"
}
