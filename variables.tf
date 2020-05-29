variable "az_addition_buffer" {
  type        = number
  description = "The numbers of \"placeholders\" to leave between subnets. This will allow you to adjust if a new az happens for a newer or smaller region."
  default     = 3
}

variable "max_azs_to_use" {
  type        = number
  description = "The maximum number of azs to allow, az_addition_buffer will not pass this number. Defaults to match us-east-1 (at time of writing), but provide padding for others. Set to a high number to disable cap. Here to hard cap cidr block usage."
  default     = 6
}

variable "base_cidr" {
  type        = string
  description = "The base cidr from which subnets are being calculated"
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
  default     = 3
}