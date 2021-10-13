# Maps of monitors
locals {
  #--------------------------------------------------------------------------------
  # ALB
  catalog_alb_files         = [for filename in fileset("${path.module}/monitors/alb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_alb_monitors_list = var.alb_monitor.enabled == true ? local.catalog_alb_files : []
  catalog_alb_list = flatten([
    for item in local.catalog_alb_monitors_list : [
      for attr_key, attr_val in var.alb_monitor.attributes : {
        key = "${attr_key}/alb/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/alb/${item}.json", {
          lb_name              = attr_val.lb_name
          lb_dns_name          = attr_val.lb_dns_name
          notification_targets = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_alb = { for item in local.catalog_alb_list : item.key => item.value }

  custom_alb_list = var.alb_monitor.enabled == true && var.alb_monitor.custom_monitors != null ? flatten([
    for key, val in var.alb_monitor.custom_monitors : [
      for attr_key, attr_val in var.alb_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_alb = {
    for item in local.custom_alb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # NLB
  catalog_nlb_files         = [for filename in fileset("${path.module}/monitors/nlb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_nlb_monitors_list = var.nlb_monitor.enabled == true ? local.catalog_nlb_files : []
  catalog_nlb_list = flatten([
    for item in local.catalog_nlb_monitors_list : [
      for attr_key, attr_val in var.nlb_monitor.attributes : {
        key = "${attr_key}/nlb/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/nlb/${item}.json", {
          lb_name              = attr_val.lb_name
          lb_dns_name          = attr_val.lb_dns_name
          notification_targets = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_nlb = { for item in local.catalog_nlb_list : item.key => item.value }

  custom_nlb_list = var.nlb_monitor.enabled == true && var.nlb_monitor.custom_monitors != null ? flatten([
    for key, val in var.nlb_monitor.custom_monitors : [
      for attr_key, attr_val in var.nlb_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_nlb = {
    for item in local.custom_nlb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # ApigatewayV2
  catalog_apigatewayv2_files         = [for filename in fileset("${path.module}/monitors/apigatewayv2/", "*.json") : trimsuffix(filename, ".json")]
  catalog_apigatewayv2_monitors_list = var.apigatewayv2_monitor.enabled == true ? local.catalog_apigatewayv2_files : []
  catalog_apigatewayv2_list = flatten([
    for item in local.catalog_apigatewayv2_monitors_list : [
      for attr_key, attr_val in var.apigatewayv2_monitor.attributes : {
        key = "${attr_key}/apigatewayv2/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/apigatewayv2/${item}.json", {
          api_id               = attr_val.api_id
          notification_targets = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_apigatewayv2 = { for item in local.catalog_apigatewayv2_list : item.key => item.value }

  custom_apigatewayv2_list = var.apigatewayv2_monitor.enabled == true && var.apigatewayv2_monitor.custom_monitors != null ? flatten([
    for key, val in var.apigatewayv2_monitor.custom_monitors : [
      for attr_key, attr_val in var.apigatewayv2_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_apigatewayv2 = {
    for item in local.custom_apigatewayv2_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  monitors_map = merge(
    local.catalog_alb,
    local.custom_alb,
    local.catalog_nlb,
    local.custom_nlb,
    local.catalog_apigatewayv2,
    local.custom_apigatewayv2
  )
  monitors = { for key, val in local.monitors_map : key => val if ! contains(var.exclude_monitors, key) }
}