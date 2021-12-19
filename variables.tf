variable "path_to_mykey" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to tty8747 public key"
}

variable "instances" {
# default = ["control.example.com", "node1.example.com", "node2.example.com"]
  default = ["control.example.com"]
}

variable "cidr_block" {
  default = "192.168.0.0/16"
}

variable "subnet" {
  default = "192.168.10.0/24"
}
