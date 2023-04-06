provider "aws" {
  region = var.region 
}

resource "aws_glue_catalog_database" "glue_database" {
  count = var.dbcreate ? 1 : 0

  name = "${var.environment}-${var.dbname}"

  description  = var.description
}
##########################################################
resource "aws_glue_crawler" "glue_crawler" {
  count = var.crawlercreate ? 1 : 0

  name          = "${var.environment}-${var.crawlername}"
  database_name = "${var.environment}-${var.dbname}"
  role          = var.glue_role

  schedule     = var.glue_schedule
 
  s3_target {
    path = var.s3_glue_path
  }
}
##########################################################
resource "aws_glue_job" "glue_job" {
  count = var.jobcreate ? 1 : 0

  name               = "${var.environment}-${var.jobname}"
  role_arn           = var.glue_role_arn
  connections        = ["${var.glue_connections}"]
  allocated_capacity = var.dpu

  command {
    script_location = var.script_location
  }
}
##############################################################
resource "aws_glue_trigger" "glue_job_trigger" {
  count = var.trigger-create ? 1 : 0

  name     = "${var.environment}-${var.glue_job_trigger_name}"
  schedule = var.schedule
  type     = var.type

  enabled     = var.enabled
  

  actions {
    job_name  = var.job_name
    arguments = var.arguments
    timeout   = var.timeout
  }
}
##################################################################
resource "aws_glue_connection" "glue_connection_vpc" {
  count = var.connection-create ? 1 : 0

  name = "${var.environment}-${var.glue_connection_name}"
  connection_properties = {
    JDBC_CONNECTION_URL = var.url
    USERNAME            = var.user
    PASSWORD            = var.pass
  }

  physical_connection_requirements {
    security_group_id_list = var.glue_sg_ids
    subnet_id              = var.glue_subnet
    availability_zone      = var.glue_az
  }

  catalog_id      = var.catalog_id
  connection_type = var.type
  description     = var.description
  match_criteria  = var.criteria
}

