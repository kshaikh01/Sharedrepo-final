# Maps of monitors
locals {
  #custom_alb = var.alb.enabled == true && lookup(var.alb, "custom_template_file", "") != "" ? (
  #  templatefile(var.alb.custom_template_file, merge({
  #    notification_targets = lookup(var.alb, "notification_targets", var.notification_targets)
  #  }, var.alb))
  #) : "{}"

  catalog_alb_list = var.alb.enabled == true ? [
    "httpcode_elb_5xx",
    "request_count",
    "target_connection_error",
    "target_response_time"
  ] : []
  catalog_alb = {
    for item in local.catalog_alb_list: "alb_${item}" => templatefile("${path.module}/monitors/alb/${item}.json", {
    lb_name              = var.alb.lb_name
    lb_dns_name          = var.alb.lb_dns_name
    notification_targets = lookup(var.alb, "notification_targets", var.notification_targets)
  }) : "{}"

  #catalog_alb_file = var.alb.enabled == true ? file("${path.module}/templates/alb.json") : "{}"
  #catalog_alb = {
  #  for key, val in jsondecode(local.catalog_alb_file) : key => jsondecode(
  #    replace(
  #      replace(
  #        replace(jsonencode(val), "$${lb_name}", var.alb.lb_name),
  #      "$${lb_dns_name}", var.alb.lb_dns_name),
  #      "$${notification_targets}", lookup(var.alb, "notification_targets", var.notification_targets)
  #    )
  #  )
  #}

  #--------------------------------------------------------------------------------
  /*
  catalog_nlb = var.nlb.enabled == true ? templatefile("${path.module}/templates/nlb.json", {
    lb_name              = var.nlb.lb_name
    lb_dns_name          = var.nlb.lb_dns_name
    notification_targets = lookup(var.nlb, "notification_targets", var.notification_targets)
  }) : "{}"

  custom_nlb = var.nlb.enabled == true && lookup(var.nlb, "custom_template_file", "") != "" ? (
    templatefile(var.nlb.custom_template_file, merge({
      notification_targets = lookup(var.nlb, "notification_targets", var.notification_targets)
    }, var.nlb))
  ) : "{}"

  #--------------------------------------------------------------------------------

  catalog_apigatewayv2 = var.apigatewayv2.enabled == true ? templatefile("${path.module}/templates/apigatewayv2.json", {
    api_id               = var.apigatewayv2.api_id
    notification_targets = lookup(var.apigatewayv2, "notification_targets", var.notification_targets)
  }) : "{}"

  custom_apigatewayv2 = var.apigatewayv2.enabled == true && lookup(var.apigatewayv2, "custom_template_file", "") != "" ? (
    templatefile(var.apigatewayv2.custom_template_file, merge({
      notification_targets = lookup(var.nlb, "notification_targets", var.notification_targets)
    }, var.apigatewayv2))
  ) : "{}"
*/
  #--------------------------------------------------------------------------------
  monitors_map = merge(
    local.catalog_alb
    #jsondecode(local.catalog_alb),
    #jsondecode(local.custom_alb),
    #jsondecode(local.catalog_nlb),
    #jsondecode(local.custom_nlb),
    #jsondecode(local.catalog_apigatewayv2),
    #jsondecode(local.custom_apigatewayv2)
  )
  monitors = { for key, val in local.monitors_map : key => val if ! contains(var.exclude_monitors, key) }
}