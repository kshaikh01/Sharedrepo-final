# Maps of monitors
locals {
  #--------------------------------------------------------------------------------
  # ALB
  catalog_alb_files = [for filename in fileset("${path.module}/monitors/alb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_alb_list  = var.alb.enabled == true ? local.catalog_alb_files : []
  catalog_alb = {
    for item in local.catalog_alb_list : "alb/${item}" => jsondecode(templatefile("${path.module}/monitors/alb/${item}.json", {
      lb_name              = var.alb.lb_name
      lb_dns_name          = var.alb.lb_dns_name
      notification_targets = lookup(var.alb, "notification_targets", var.notification_targets)
    }))
  }

  custom_alb_list = var.alb.enabled == true && var.alb.custom_monitors != null ? [
    for key, val in var.alb.custom_monitors : {
      id       = key
      template = val
    }
  ] : []
  custom_alb = {
    for item in local.custom_alb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(var.alb, "notification_targets", var.notification_targets)
    }, var.alb)))
  }

  #--------------------------------------------------------------------------------
  # NLB
  catalog_nlb_files = [for filename in fileset("${path.module}/monitors/nlb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_nlb_list  = var.nlb.enabled == true ? local.catalog_nlb_files : []
  catalog_nlb = {
    for item in local.catalog_nlb_list : "nlb/${item}" => jsondecode(templatefile("${path.module}/monitors/nlb/${item}.json", {
      lb_name              = var.nlb.lb_name
      lb_dns_name          = var.nlb.lb_dns_name
      notification_targets = lookup(var.nlb, "notification_targets", var.notification_targets)
    }))
  }

  custom_nlb_list = var.nlb.enabled == true && var.nlb.custom_monitors != null ? [
    for key, val in var.nlb.custom_monitors : {
      id       = key
      template = val
    }
  ] : []
  custom_nlb = {
    for item in local.custom_nlb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(var.nlb, "notification_targets", var.notification_targets)
    }, var.nlb)))
  }

  #--------------------------------------------------------------------------------
  # ApigatewayV2
  catalog_apigatewayv2_files = [for filename in fileset("${path.module}/monitors/apigatewayv2/", "*.json") : trimsuffix(filename, ".json")]
  catalog_apigatewayv2_list  = var.apigatewayv2.enabled == true ? local.catalog_apigatewayv2_files : []
  catalog_apigatewayv2 = {
    for item in local.catalog_apigatewayv2_list : "nlb/${item}" => jsondecode(templatefile("${path.module}/monitors/apigatewayv2/${item}.json", {
      api_id               = var.apigatewayv2.api_id
      notification_targets = lookup(var.apigatewayv2, "notification_targets", var.notification_targets)
    }))
  }

  custom_apigatewayv2_list = var.nlb.enabled == true && var.apigatewayv2.custom_monitors != null ? [
    for key, val in var.apigatewayv2.custom_monitors : {
      id       = key
      template = val
    }
  ] : []
  custom_apigatewayv2 = {
    for item in local.custom_apigatewayv2_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(var.apigatewayv2, "notification_targets", var.notification_targets)
    }, var.apigatewayv2)))
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