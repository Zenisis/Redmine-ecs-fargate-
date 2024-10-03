# Elastic IP
resource "aws_eip" "main" {
  vpc   = true
  tags = {
    Name = "redmine-eip"
  }
}
