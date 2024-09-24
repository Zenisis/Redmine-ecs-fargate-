resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "redmine-vpc"
  }
}
resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"  # Change this to match your region
  
  tags = {
    Name = "redmine-public-subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"  # Change this to match your region
  
  tags = {
    Name = "redmine-public-subnet-2"
  }
}
