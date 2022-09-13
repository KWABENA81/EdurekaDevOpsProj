# Provider
provider "aws" {
    region = "us-east-1"
    access_key = "AKIA462NILFRFOBXQXRI"
    secret_key = "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"
}

# Instance resource creation
resource "aws_instance" "terraform-instance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"

  tags = {
    Name = "tf-instance"
  }

}

# Elastice IP resource creation
resource "aws_eip" "terraform-instance-eip" {
  vpc      = true

  tags = {
      Name = "tif-eip"
   }
}

# Instance - Elastic IP Association
resource "aws_eip_association" "instance-eip_assoc" {
  instance_id   = aws_instance.terraform-instance.id
  allocation_id = aws_eip.terraform-instance-eip.id
}
