variable "region" {
  type        = string
  default     = "ca-central-1"
  description = "Enter Your Region Name"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.80.0.0/16"
  description = "Enter Your vpc cidr"
}
variable "subnet1-cidr" {
  type        = string
  default     = "10.80.1.0/24"
  description = "Enter Your subnet1"
}
variable "subnet2-cidr" {
  type        = string
  default     = "10.80.2.0/24"
  description = "Enter Your subnet2"
}
variable "subnet3-cidr" {
  type        = string
  default     = "10.80.3.0/24"
  description = "Enter Your subnet3"
}
variable "subnet4-cidr" {
  type        = string
  default     = "10.80.4.0/24"
  description = "Enter Your subnet4"
}
variable "az1" {
  type        = string
  default     = "ca-central-1a"
  description = "Enter Your az1 name"
}
variable "az2" {
  type        = string
  default     = "ca-central-1b"
  description = "Enter Your az2 name"
}
variable "alb_sg_name" {
  type        = string
  default     = "metroc-alb-sg"
  description = "Enter your security group load balancer"
}
variable "ec2_sg_name" {
  type        = string
  default     = "metroc-ec2-sg"
  description = "Enter your security group ec2"
}
