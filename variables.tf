variable "az_addition_buffer" {
  type        = number
  description = "The numbers of \"placeholders\" to leave between subnets. This will allow you to adjust if a new az happens."
  default     = 4
}

variable "base_cidr" {
  type        = string
  description = "The base cidr that subnets are being calculated"
  default     = "10.10.0.0/16"
}

variable "cidr_bit_mask" {
  type        = number
  description = "The bit mask number to add. EG to turn X.X.X.X/16 to X.X.X.X/24 you want the value of 8."
  default     = 8
}

variable "num_subnet_groups" {
  type        = number
  description = "The number of individual groups of subnets you want. EG for public and private, you'd want to use the value 2, where as if you need rds also, use the value 3."
  default     = 4
}