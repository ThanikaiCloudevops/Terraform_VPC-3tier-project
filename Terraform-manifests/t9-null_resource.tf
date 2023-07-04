# use null resource for execute file inside the private application

resource "null_resource" "exec" {
    depends_on = [ module.public-ec2-instance ]

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = aws_eip.elatic-ip.public_ip
    timeout = "1m"
    private_key = file("${path.module}/private-key/terraform-key.pem")
  }

  # Copies the file as the root user using SSH
  provisioner "file" {
  source      = "private-key/terraform-key.pem"
  destination = "tmp/terraform-key.pem"
    }
  # remote exec to execute commands
  provisioner "remote-exec" {
    inline = [
       "sudo chmod 600 tmp/terraform-key.pem",
      #  "sudo amazon-linux-extras enable nginx1.12",
      #  "sudo yum -y install nginx",
      #  "sudo systemctl start nginx"
        # file("${path.module}/app-install.sh")

      
    ]
  }

  # local -exec excute the script in instance
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "${path.module}/local-exec-output-file"
    # when = destroy
    on_failure = continue
  }
  
}