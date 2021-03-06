output "ec2_webserver" {
  value = aws_instance.myec2.id
}