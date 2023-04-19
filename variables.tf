variable "region" {
  description = "name of the aws region"
  type = string
  default = "us-east-1"
}

variable "dbcreate" {
  description = "whether glue database should be created ot not"
  type = bool
  default = true
}
variable "environment" {
  description = "The environment to deploy to."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod", "sit", "snd", "uat"], var.environment)
    error_message = "Valid values for var: environment are (dev, prod, sit, snd, uat)."
  }
}
variable "dbname" {
  description = "name of the glue database"
  default = "demodatabase"
}

variable "description" {
  description = "glue database "
  default = "glue database"
}
##################################################################
variable "crawlercreate" {
  description = "whether glue crawler should be created ot not"
  type = bool
  default = true
}
variable "crawlername" {
  description = "name of the glue database"
  default = "democrawler"
}
variable "glue_role_arn" {
  type = string
  default = "arn:aws:iam::859662211748:role/glue-role"
}
variable "glue_schedule" { #"cron(0 1 * * ? *)"
type = string
  default = "cron(22 15 * * ? *)"
}
variable "s3_glue_path" {
  type = string
  default = "s3://archu123archu/test.csv"  #"s3://${aws_s3_bucket.data_lake_bucket.bucket}"
}
######################################################################
variable "glue_jobcreate" {
  type = bool
  default = false
}
variable "glue_jobname" {
  type = string
  default = "demojob"
}

variable "glue_connections" {
  type    = list
  default = []
}

variable "dpu" {
  default = ""
}
variable "script_location" {
  default = ""
  
}
########################################################################
variable "create_gluejob_trigger" {
  default = false
}
variable "glue_job_trigger_name" {
  default = "demojob"
}
variable "glue_job_trigger_schedule" { #"cron(0 1 * * ? *)"
  default = "cron(22 15 * * ? *)"
}
variable "type" {
  description = "It can be CONDITIONAL, ON_DEMAND, and SCHEDULED."
  default     = "SCHEDULED"
}

variable "enabled" {
  default = true
}

variable "arguments" {
  type    = map
  default = {}
}

variable "timeout" {
  default = 2880
}
#####################################################################
variable "create_glue_connection" {
  default = true
}
variable "glue_connection_name" {
  default = "demo-connection"
  
}
variable "JDBC_url" {
  default = "jdbc:redshift://dev-democluster.cao46ykrjq2g.us-east-1.redshift.amazonaws.com:5439/demorsdb"
}

variable "user" {
  default = "awsuser"
}

variable "pass" {
  default = "Password1234"
}

variable "sg_ids" {
  default = ""
}

variable "subnet" {
  default = ""
}

variable "az" {
  default = ""
}

variable "catalog_id" {
  type = string
  default = ""
}

# variable "connection_type" {
#   type = string
#   default = "JDBC"
# }
variable "description" {
  type = string
  default = ""
  
}

variable "match_criteria" {
  type    = list
  default = []
}





