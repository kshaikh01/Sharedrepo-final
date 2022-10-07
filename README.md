# terraform-modules-datadog-catalog
Generates map objects defining datadog monitors/dashboards so that it can be passed into 'terraform-modules-datadog' to generate resources in datadog.

## Monitors
Default catalog monitors can be found in `monitors` directory.
Monitor key names in return object have the format "{service_name}/{resource_type}/{monitor_name}" where:
- service_name: The key name within `attributes`
- resource_type: The directory name within `monitors` directory
- monitor_name: File name within `monitors/{resource_type} without the extension 
`custom_monitors` map can override default catalog monitor definitions by using key name "{resource_type}/{monitor_name}"
For each `attributes` in monitor map:
- Optional parameter, notification_targets, can also be passed in to override the value passed to module through notification_targets variable.
- Additional key/value pairs can be passed in so that any custom monitor templates that have additional template variables will apply them.

# usage #
```hcl
# Generate Monitor Map
module "datadog_catalog_monitors" {
  source = "git@github.com:HappyMoneyInc/terraform-modules-datadog-catalog.git?ref=v0.3.0"
  alb_monitor = {
    enabled = true
    custom_monitors = {
      "alb/request_count"  = "${path.module}/custom_alb/request_count.json"      # Overriding a default template
      "healthy_host_count" = "${path.module}/custom_alb/healthy_host_count.json" # Adding additional monitors
    }
    attributes = {
      for key, val in var.services : key => {
        lb_name      = "ec2-lb-${key}-${var.environment}-ue1"
        lb_dns_name  = module.lb[key].aws_lb_dns_name
      }
    }
  }

  apigatewayv2_monitor = {
    enabled         = true
    custom_monitors = null
    attributes = {
      for key, val in var.services : key => {
        name   = key
        api_id = module.apigatewayv2[key].api_id
      }
    }
  }

  notification_targets = "@slack-some_test_channel @pagerduty-test_alert"
}
```

## Inputs
| Name                | Description                                                                                | Type | Default | Required |
|---------------------|--------------------------------------------------------------------------------------------|:----:|:-----:|:-----:|
| alb_monitor         | alb_monitor object to include DD alb monitor maps in output.                               | map | `{ enabled = false, custom_monitors = null }` | no |
| apigateway_monitor  | apigateway_monitor object to include DD api gateway REST API monitor maps in output.       | map | `{ enabled = false, custom_monitors = null }` | no |
| apigatewayv2_monitor | apigatewayv2_monitor object to include DD api gateway v2 monitor maps in output.           | map | `{ enabled = false, custom_monitors = null }` | no |
| cloudfront_monitor  | cloudfront_monitor object to include DD cloudfront distribution monitor maps in output.    | map | `{ enabled = false, custom_monitors = null }` | no |
| docdb_monitor       | docdb_monitor object to include DD document DB monitor maps in output.                     | map | `{ enabled = false, custom_monitors = null }` | no |
| dynamodb_monitor    | dynamodb_monitor object to include DD dynamodb monitor maps in output.                     | map | `{ enabled = false, custom_monitors = null }` | no |
| ecs_monitor         | ecs_monitor object to include DD ECS monitor maps in output.                               | map | `{ enabled = false, custom_monitors = null }` | no |
| lambda_monitor      | lambda_monitor object to include DD lambda monitor maps in output.                         | map | `{ enabled = false, custom_monitors = null }` | no |
| nlb_monitor         | nlb_monitor object to include DD nlb monitor maps in output.                               | map | `{ enabled = false, custom_monitors = null }` | no |
| rds_monitor         | rds_monitor object to include DD RDS monitor maps in output.                               | map | `{ enabled = false, custom_monitors = null }` | no |
| spring_monitor      | spring_monitor object to include DD Spring monitor maps in output.                         | map | `{ enabled = false, custom_monitors = null }` | no |
| service_monitor | error_monitor object to include DD error monitor maps in output.                           | map | `{ enabled = false, custom_monitors = null }` | no |
| notification_targets | String including the notification targets for alerts delimited by space.                                | string | `""` | no |
| exclude_monitors     | List of monitor key names that will be excluded from creation. Can be used to disable defaults defined. | list | `[]` | no |

#### alb_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `lb_name` and `lb_dns_name`. |

#### apigateway_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `name` and `api_id`. |

#### apigatewayv2_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `name` and `api_id`. |

#### cloudfront_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `name` and `distribution_id`. |

#### docdb_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `db_cluster_identifier`. |

#### dynamodb_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `table_name`. |

#### ecs_monitor Properties
| Name | Description                                                                                                                 |
|------|-----------------------------------------------------------------------------------------------------------------------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors.                                              |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `service_name`, `runbook_url` , `env`.                                     |

#### lambda_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `function_name`. |

#### nlb_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `lb_name` and `lb_dns_name`. |

#### rds_monitor Properties
| Name | Description |
|------|-------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors. |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `db_cluster_identifier`. |

#### spring_monitor Properties
| Name | Description                                                                                                                 |
|------|-----------------------------------------------------------------------------------------------------------------------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors.                                                |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `service_name`, `runbook_url` , `env`.                                         |

#### spring threshold attributes
| Name                                   | Description                                                         |
|----------------------------------------|---------------------------------------------------------------------|
| p50_critical_threshold                 | Critical threshold default - `0.8` , range can be `[0+]`.        |
| p50_warning_threshold                  | Warning threshold default - `0.7` , range can be `[0+]`.         |
| p90_critical_threshold                 | Critical threshold default - `1` , range can be `[0+`.          |
| p90_warning_threshold                  | Warning threshold default - `0.9` , range can be `[0+]`.         |
| error_rate_warning_threshold           | Warning threshold default - `0.01` , range can be `[0-100]`.        |
| error_rate_critical_threshold          | Critical threshold default - `0.05` , range can be `[0-100]`.       |
| throughput_critical_recovery_threshold | Critical recovery threshold default - `0` , range can be `[0-100]`. |
| throughput_critical_threshold          | Critical threshold default - `1` , range can be `[0-100]`.          |
| service_name                           | This will be service the name like(lmp-document-green).             |
| runbook_url                            | It will be used to refer the runbook for particular alert.          |
Note :- Critical Threshold Should Always be greater than Warning Threshold.

#### service_monitor Properties
| Name | Description                                                                                                                 |
|------|-----------------------------------------------------------------------------------------------------------------------------|
| enabled | Required. Boolean value to enable or disable including into map of monitors.                                              |
| custom_monitors | Required if enabled. Key/value pairs where value is path to template file that defines a monitor. Set to `null` to disable. |
| attributes | Required if enabled. Map where each includes `service_name`,`runbook_url` , `env`.                                     |
 
#### service threshold attributes
| Name                                   | Description                                                |
|----------------------------------------|------------------------------------------------------------|
| latest_deployment_critical_threshold   | Critical threshold default - `0` , range can be `[0-100]`. |
| log_warning_threshold                  | Warning threshold default - `1` , range can be `[0-100]`.  |
| log_critical_threshold                 | Critical threshold default - `5` , range can be `[0-100]`. |
| faulty_deployment critical_threshold   | Warning threshold default - `0` , range can be `[0-100]`.  |
Note :- Critical Threshold Should Always be greater than Warning Threshold.

## Outputs
| Name | Description |
|------|-------------|
| monitors | Map of monitors that can be passed into terraform-modules-datadog |
| dashboards | Map of dashboards that can be passed into terraform-modules-datadog |
