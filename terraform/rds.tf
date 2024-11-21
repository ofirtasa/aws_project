resource "aws_db_instance" "main" {
  identifier = "mydb-instance"
  engine     = "mysql"
  username   = var.db_username
  password   = var.db_password
  instance_class = var.db_instance_class
  db_name    = "mydb"
  publicly_accessible = true
  allocated_storage = 20
}
