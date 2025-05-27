variable "vpc_id" {
  type        = string
}
variable "AZ_count" {
  type        = number
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "pub_subnets" {
  type        = list(string)
}

variable "pvt_subnets" {
  type        = list(string)
}

variable "db_subnets" {
  type        = list(string)
}