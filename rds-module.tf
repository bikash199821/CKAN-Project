module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "ocl-ckan"

  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "oclckan"
  username = "dbadmin"
  port     = "5432"

  iam_database_authentication_enabled = true


  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.public_subnets

  family = "postgres13"


  # Database Deletion Protection
  deletion_protection = true

 
}