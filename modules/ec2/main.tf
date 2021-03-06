module "sg" {
    source = "../sg"
}

resource "aws_instance" "myec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.sg.cpe_security_group]
#   key_name               = var.key_name

  user_data = <<-EOF
  #!/bin/bash
  sudo amazon-linux-extras install nginx1 -y
  sudo service nginx start
  EOF

#   provisioner "remote-exec" {
#     connection {
#       host        = self.public_ip
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file(var.private_key_path)
#     }
#     inline = [
#       "sudo amazon-linux-extras install nginx1 -y",
#       "sudo service nginx start",
#     ]
#   }
}
