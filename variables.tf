variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "subnets" {
  type    = list(string)
  default = []
}

variable "app" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "env" {
  type    = string
  default = ""
}

variable "aws_account" {
  type    = list(string)
  default = []
}

variable "ng_min_size" {
  type    = number
  default = 1
}

variable "ng_max_size" {
  type    = number
  default = 2
}

variable "ng_desired_size" {
  type    = number
  default = 2
}

variable "default_instance_size" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "eks_version" {
  type    = string
  default = "1.25"
}