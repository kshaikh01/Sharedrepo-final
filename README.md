# terraform-modules-datadog-catalog
Generates map objects defining datadog monitors/dashboards so that it can be passed into 'teraform-modules-datadog' to generate resources in datadog.

# usage #
```hcl
# Generate Monitor Map
module "datadog_catalog_monitors" {
  source = "git@github.com:HappyMoneyInc/terraform-modules-datadog-catalog.git?ref=v1.0.0"
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
        api_id = module.apigatewayv2[key].api_id
      }
    }
  }
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb_monitor | alb_monitor object to include DD alb monitor maps in output. | map | `{ enabled = false, custom_monitors = null }` | no |
| apigatewayv2_monitor | apigatewayv2_monitor object to include DD api gateway v2 monitor maps in output. | map | `{ enabled = false, custom_monitors = null }` | no |
| nlb_monitor | nlb_monitor object to include DD nlb monitor maps in output. | map | `{ enabled = false, custom_monitors = null }` | no |
| notification_targets | String including the notification targets for alerts. | string | `""` | no |
| exclude_monitors | List of monitor key names that will be excluded from creation. Can be used to disable defaults defined. | list | `[]` | no |

## Outputs
| Name | Description |
|------|-------------|
| monitors | Map of monitors that can be passed into terraform-modules-datadog |
| dashboards | Map of dashboards that can be passed into terraform-modules-datadog |