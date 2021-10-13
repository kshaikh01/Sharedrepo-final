variable "id" {
  type = string
}

locals {
  services = {
    (var.id) = ""
  }
  notification_targets = "@slack-devops_test_channel"
}

resource "random_string" "mock_alb" {
  for_each = local.services
  length   = 8
  special  = false
}

resource "random_string" "mock_nlb" {
  for_each = local.services
  length   = 8
  special  = false
}

resource "random_string" "mock_apigatewayv2" {
  for_each = local.services
  length   = 8
  special  = false
}

module "test" {
  source = "../"
  alb_monitor = {
    enabled = true
    custom_monitors = {
      "alb/request_count" = "${path.module}/custom_alb/test_override.json"
      "custom_alb"        = "${path.module}/custom_alb/test_custom.json"
    }
    attributes = {
      for key, val in local.services : key => {
        lb_name      = random_string.mock_alb[key].result
        lb_dns_name  = random_string.mock_alb[key].result
        some_new_var = "hello"
      }
    }
  }

  nlb_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        lb_name     = random_string.mock_nlb[key].result
        lb_dns_name = random_string.mock_nlb[key].result
      }
    }
  }

  apigatewayv2_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in local.services : key => {
        api_id = random_string.mock_apigatewayv2[key].result
      }
    }
  }

  notification_targets = local.notification_targets
  exclude_monitors     = []
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
    }
  )
}