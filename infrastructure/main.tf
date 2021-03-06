# These
/* are */
// comments.

module "eip_module" {
  source = "github.com/kamn8r/totally-terraform/modules/eip"
}

module "ec2_module" {
  source = "../modules/ec2"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2_module.ec2_webserver
  allocation_id = module.eip_module.public_ip

  provisioner "local-exec" {
    command = "echo ${aws_eip_association.eip_assoc.public_ip} > public_ip.txt"
  }
}