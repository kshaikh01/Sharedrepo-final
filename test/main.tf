variable "id" {
  type = string
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.0"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "dd_api_key" {
  name = "/logging/datadog_token"
}

provider "datadog" {
  # APP KEY from env variable DD_APP_KEY
  api_key = data.aws_ssm_parameter.dd_api_key.value
}

locals {
  services = {
    (var.id) = ""
  }
  notification_targets = "@slack-devops_test_channel"
  resource_types = [
    "alb",
    "nlb",
    "apigateway",
    "apigatewayv2",
    "cloudfront",
    "docdb",
    "dynamodb",
    "ecs",
    "lambda",
    "nlb",
    "rds",
    "spring",
    "service",
    "apdex"
  ]
  service_resource_list = flatten([
    for key, val in local.services : [
      for type in local.resource_types : "${key}_${type}"
    ]
  ])
}

resource "random_string" "mock_resource_id" {
  for_each = toset(local.service_resource_list)
  length   = 8
  special  = false
}

module "test" {
  source = "../"
  alb_monitor = {
    enabled = true
    custom_monitors = {
      "alb/httpcode_elb_5xx" = "${path.module}/test_override.json"
      "custom_alb"           = "${path.module}/test_custom.json"
    }
    attributes = {
      for key, val in local.services : key => {
        lb_name      = random_string.mock_resource_id["${key}_alb"].result
        lb_dns_name  = random_string.mock_resource_id["${key}_alb"].result
        some_new_var = "hello"
      }
    }
  }

  apigateway_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        api_id = random_string.mock_resource_id["${key}_apigateway"].result
      }
    }
  }

  apigatewayv2_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        api_id = random_string.mock_resource_id["${key}_apigatewayv2"].result
      }
    }
  }

  cloudfront_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        distribution_id = random_string.mock_resource_id["${key}_cloudfront"].result
      }
    }
  }

  docdb_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        db_cluster_identifier = random_string.mock_resource_id["${key}_docdb"].result
      }
    }
  }

  dynamodb_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        table_name = random_string.mock_resource_id["${key}_dynamodb"].result

      }
    }
  }

  ecs_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        service_name = random_string.mock_resource_id["${key}_ecs"].result
        runbook_url  = "https://foo.bar/page"
      }
    }
  }

  lambda_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        function_name = random_string.mock_resource_id["${key}_lambda"].result
      }
    }
  }

  nlb_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        lb_name     = random_string.mock_resource_id["${key}_nlb"].result
        lb_dns_name = random_string.mock_resource_id["${key}_nlb"].result
      }
    }
  }

  rds_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        db_cluster_identifier = random_string.mock_resource_id["${key}_rds"].result
      }
    }
  }

  spring_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        env                                    = "test"
        p50_critical_threshold                 = 1
        p90_critical_threshold                 = 1.2
        error_rate_warning_threshold           = 0.01
        error_rate_critical_threshold          = 0.05
        throughput_critical_recovery_threshold = 0
        throughput_critical_threshold          = 1
        runbook_url                            = "https://foo.bar/page"
        service_name                           = random_string.mock_resource_id["${key}_spring"].result
      }
    }
  }

  service_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        env                                  = "test"
        latest_deployment_critical_threshold = 0
        log_warning_threshold                = 1
        log_critical_threshold               = 5
        excessive_log_critical_threshold     = 3000
        faulty_deployment_critical_threshold = 0
        runbook_url                          = "https://foo.bar/page"
        service_name                         = random_string.mock_resource_id["${key}_service"].result
      }
    }
  }

  apdex_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        env          = "test"
        service_name = random_string.mock_resource_id["${key}_apdex"].result
      }
    }
  }

  notification_targets = local.notification_targets
  exclude_monitors     = []
}

# Test to ensure for_each works on generated monitors map
module "datadog_monitor" {
  source   = "git@github.com:HappyMoneyInc/terraform-modules-datadog.git?ref=v0.1.3"
  monitors = module.test.monitors
}

module "test_empty" {
  source = "../"
}

output "module_output" {
  value = module.test
}

output "output_json" {
  value = jsonencode({
    id             = var.id
    monitors       = module.test.monitors
    empty_monitors = module.test_empty.monitors
    mock_resource_ids = {
      for key, val in random_string.mock_resource_id : key => val.result
    }
    env = "test"
  })
}
