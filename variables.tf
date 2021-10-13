variable "alb" {
  description = "Map object inputs to generate monitor map for ALB"
  default = {
    enabled         = false
    custom_monitors = null
  }
}

variable "nlb" {
  description = "Map object inputs to generate monitor map for NLB"
  default = {
    enabled         = false
    custom_monitors = null
  }
}

variable "apigatewayv2" {
  description = "Map object inputs to generate monitor map for Api Gateway V2"
  default = {
    enabled         = false
    custom_monitors = null
  }
}

variable "notification_targets" {
  type    = string
  default = ""
}

variable "exclude_monitors" {
  type        = list(string)
  description = "List of monitor key names that will be excluded from creation. Can be used to disable defaults defined."
  default     = []
}