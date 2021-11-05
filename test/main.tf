variable "id" {
  type = string
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
    "apigatewayV2",
    "docdb",
    "dynamodb",
    "ecs",
    "lambda",
    "nlb",
    "rds"
  ]
  service_resource_list = flatten([
    for key, val in local.services : [
      for type in local.resource_types : "${key}_${type}"
    ]
  ])
}

resource "random_string" "mock_resource_id" {
  for_each = local.service_resource_list
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

  apigatewayv2_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        api_id = random_string.mock_resource_id["${key}_apigatewayv2"].result
      }
    }
  }

  notification_targets = local.notification_targets
  exclude_monitors     = []
}

# Test to ensure for_each works on generated monitors map
resource "null_resource" "test" {
  for_each = module.test.monitors
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
  })
}