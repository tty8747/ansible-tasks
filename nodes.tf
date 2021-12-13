resource "aws_key_pair" "ansible-key" {
  key_name   = "ansible-key"
  public_key = file(var.path_to_mykey)
}
