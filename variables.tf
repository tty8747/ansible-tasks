variable "path_to_mykey" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to tty8747 public key"
}

variable "instances" {
  default = [ "control.example.com", "node1.example.com", "node2.example.com" ]
}
