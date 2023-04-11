# Create EC2 instances
resource "aws_instance" "web" {
  count             = 2
  ami               = "ami-0c55b159cbfafe1f0"
  instance_type     = "t2.micro"
  subnet_id         = count.index == 0 ? aws_subnet.public1.id : aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.instances_sg.id]
  tags = {
    Name = "example-instance-${count.index}"
  }
}

# Create Elasticache cluster
resource "aws_elasticache_cluster" "el_cluster" {
  cluster_id               = "example-elasticache-cluster"
  engine                   = "redis"
  node_type                = "cache.t2.micro"
  num_cache_nodes          = 1
  subnet_group_name        = aws_elasticache_subnet_group.el_cluster.name
  parameter_group_name     = aws_elasticache_parameter_group.el_cluster.name
}

# Create RDS master instance
resource "aws_db_instance" "master" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = "example-master-db"
  username                = "admin"
  password                = "password"
  db_subnet_group_name     = aws_db_subnet_group.el_cluster.name
}

# Create RDS secondary instance
resource "aws_db_instance" "secondary" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = "example-secondary-db"
  username                = "admin"
  password                = "password"
  db_subnet_group_name     = aws_db_subnet_group.el_cluster.name
}
