

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
  role          = var.glue_role_arn

  schedule     = var.glue_schedule 
 
  s3_target {
    path = var.s3_glue_path
  }
}
# ##########################################################
# resource "aws_glue_job" "glue_job" {
#   count = var.glue_jobcreate ? 1 : 0

#   name               = "${var.environment}-${var.glue_jobname}"
#   role_arn           = var.glue_role_arn
#   #connections        = ["${var.glue_connections}"]
#   #allocated_capacity = var.dpu

#   command {
#     script_location = var.script_location
#   }
# }
# ##############################################################
# resource "aws_glue_trigger" "glue_job_trigger" {
#   count = var.create_gluejob_trigger ? 1 : 0

#   name     = "${var.environment}-${var.glue_job_trigger_name}"
#   schedule = var.glue_job_trigger_schedule
#   type     = var.type

#   enabled     = var.enabled
  

#   actions {
#     job_name  = var.glue_jobname
#     arguments = var.arguments
#     timeout   = var.timeout
#   }
# }
# ##################################################################
# resource "aws_glue_connection" "glue_connection" {
#   count = var.create_glue_connection ? 1 : 0

#   name = "${var.environment}-${var.glue_connection_name}"
#   connection_properties = {
#     JDBC_CONNECTION_URL = var.JDBC_url
#     USERNAME            = var.user
#     PASSWORD            = var.pass
#   }

#   physical_connection_requirements {
#     security_group_id_list = var.sg_ids
#     subnet_id              = var.subnet
#     availability_zone      = var.az
#   }

#   catalog_id      = var.catalog_id
#   connection_type = var.connection_type
#   description     = var.description
#   match_criteria  = var.match_criteria
# }

