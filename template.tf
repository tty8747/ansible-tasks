data "template_file" "gen_inventory" {
  template = templatefile("${path.module}/templates/inventory.yml.tmpl",
     {
       names        = var.instances
       ips          = aws_instance.node.*.public_ip
       # dns-name     = aws_route53_record.node.*.name
       ansible_user = "centos"
       ansible_port = "22"
     }
  )
}

resource "local_file" "save_inventory" {
    content = data.template_file.gen_inventory.rendered
    filename = "${path.module}/ansible/inventory/hosts.yml"
}
