# resource "aws_key_pair" "my_key_pair" {
#   key_name   = "lucky-key-pair"     
#   public_key = file("/Users/A2354661/Desktop/python-practice/HeroVired/assignment/MERN-Application-AWS-IAC-Deployment/lucky-key-pair.pem") 
# }

resource "aws_instance" "web_server" {
  ami           = "ami-07d9cf938edb0739b" 
  instance_type = "t2.micro"
  key_name      = "lucky-key-pair"
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "db_server" {
  ami           = "ami-07d9cf938edb0739b" 
  instance_type = "t2.micro"
  key_name      = "lucky-key-pair"
  subnet_id = aws_subnet.private_subnet.id

  tags = {
    Name = "db-server"
  }
}
