variable "region" {
  description = "name of the aws region"
  type = string
  default = "eu-west-1"
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
  type = bool
  default = true
}
variable "db" {
}
variable "role" {}
variable "schedule" {
  default = ""
}
variable "s3_path" {}
######################################################################
variable "jobcreate" {
  default = true
}
variable "connections" {
  type    = "list"
  default = []
}
variable "role_arn" {}
variable "dpu" {
  default = 2
}
########################################################################
variable "trigger-create" {
  default = true
}

variable "type" {
  description = "It can be CONDITIONAL, ON_DEMAND, and SCHEDULED."
  default     = "SCHEDULED"
}

variable "schedule" {}

variable "enabled" {
  default = true
}
variable "job_name" {}

variable "arguments" {
  type    = "map"
  default = {}
}

variable "timeout" {
  default = 2880
}
#####################################################################
variable "conn-create" {
  default = true
}
variable "url" {}

variable "user" {}

variable "pass" {}

variable "sg_ids" {
  default = ""
}

variable "subnet" {
  default = ""
}

variable "azs" {
  default = ""
}

variable "catalog_id" {
  default = ""
}

variable "type" {
  type = string
  default = "JDBC"
}

variable "description" {
  type = string
  default = ""
}

variable "criteria" {
  type    = "list"
  default = []
}





