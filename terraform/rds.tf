# Create a DB subnet group for the RDS instance
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  subnet_ids  = aws_subnet.public.*.id
  description = "My DB subnet group"
}

# Create RDS MySQL instance
resource "aws_db_instance" "my_rds_instance" {
  identifier          = "my-rds-instance"     
  engine              = "mysql"               
  engine_version      = "8.0"                 
  instance_class      = "db.t3.micro"         
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name 
  allocated_storage   = 20            
  storage_type         = "gp2"        
  db_name             = "mydatabase"          
  username            = "admin"               
  password            = "password123"         
  port                = 3306                  
  multi_az            = false                 
  publicly_accessible = true                  
  tags = {
    Name = "MyRDSInstance"
  }
}
