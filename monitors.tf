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
          lb_name                        = attr_val.lb_name
          lb_dns_name                    = attr_val.lb_dns_name
          notification_targets           = lookup(attr_val, "notification_targets", var.notification_targets)
          alb_httpcode_elb_5xx_timeframe = lookup(attr_val, "alb_httpcode_elb_5xx_timeframe", "last_5m")
          alb_httpcode_elb_5xx_operator  = lookup(attr_val, "alb_httpcode_elb_5xx_operator", ">")
          alb_httpcode_elb_5xx_critical  = lookup(attr_val, "alb_httpcode_elb_5xx_critical", 0)
          alb_connection_error_timeframe = lookup(attr_val, "alb_connection_error_timeframe", "last_5m")
          alb_connection_error_operator  = lookup(attr_val, "alb_connection_error_operator", ">")
          alb_connection_error_critical  = lookup(attr_val, "alb_connection_error_critical", 0)
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
  # Apigateway
  catalog_apigateway_files         = [for filename in fileset("${path.module}/monitors/apigateway/", "*.json") : trimsuffix(filename, ".json")]
  catalog_apigateway_monitors_list = var.apigateway_monitor.enabled == true ? local.catalog_apigateway_files : []
  catalog_apigateway_list = flatten([
    for item in local.catalog_apigateway_monitors_list : [
      for attr_key, attr_val in var.apigateway_monitor.attributes : {
        key = "${attr_key}/apigateway/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/apigateway/${item}.json", {
          name                                  = lookup(attr_val, "name", attr_val.api_id)
          api_id                                = attr_val.api_id
          notification_targets                  = lookup(attr_val, "notification_targets", var.notification_targets)
          apigateway_4xxerror_timeframe         = lookup(attr_val, "apigateway_4xxerror_timeframe", "last_5m")
          apigateway_4xxerror_operator          = lookup(attr_val, "apigateway_4xxerror_operator", ">=")
          apigateway_4xxerror_critical          = lookup(attr_val, "apigateway_4xxerror_critical", 1)
          apigateway_4xxerror_critical_recovery = lookup(attr_val, "apigateway_4xxerror_critical", 0)
          apigateway_5xxerror_timeframe         = lookup(attr_val, "apigateway_5xxerror_timeframe", "last_5m")
          apigateway_5xxerror_operator          = lookup(attr_val, "apigateway_5xxerror_operator", ">=")
          apigateway_5xxerror_critical          = lookup(attr_val, "apigateway_5xxerror_critical", 1)
          apigateway_5xxerror_critical_recovery = lookup(attr_val, "apigateway_5xxerror_critical", 0)
          apigateway_count_timeframe         = lookup(attr_val, "apigateway_count_timeframe", "last_5m")
          apigateway_count_operator          = lookup(attr_val, "apigateway_count_operator", ">=")
          apigateway_count_critical          = lookup(attr_val, "apigateway_count_critical", 1)
          apigateway_latency_maximum        = lookup(attr_val, "apigateway_latency_maximum_timeframe", "last_5m")
          apigateway_latency_maximum         = lookup(attr_val, "apigateway_latency_maximum_operator", ">=")
          apigateway_latency_maximum          = lookup(attr_val, "apigateway_latency_maximum_critical", 1)
          apigateway_latency_minimum        = lookup(attr_val, "apigateway_integration_latency_minimum_timeframe", "last_5m")
          apigateway_latency_minimum        = lookup(attr_val, "apigateway_integration_latency_minimum_operator", ">=")
          apigateway_latency_minimum         = lookup(attr_val, "apigateway_integration_latency_minimum_critical", 1)
          apigateway_integration_latency_p90       = lookup(attr_val, "apigateway_integration_latency_p90_timeframe", "last_5m")
          apigateway_integration_latency_p90       = lookup(attr_val, "apigateway_integration_latency_p90_operator", ">=")
          apigateway_integration_latency_p90       = lookup(attr_val, "apigateway_integration_latency_p90_critical", 1)
          apigateway_integration_latency_p95       = lookup(attr_val, "apigateway_integration_latency_p95_timeframe", "last_5m")
          apigateway_integration_latency_p95       = lookup(attr_val, "apigateway_integration_latency_p95_operator", ">=")
          apigateway_integration_latency_p95       = lookup(attr_val, "apigateway_integration_latency_p95_critical", 1)
          apigateway_integration_latency_p99       = lookup(attr_val, "apigateway_integration_latency_p99_timeframe", "last_5m")
          apigateway_integration_latency_p99       = lookup(attr_val, "apigateway_integration_latency_p99_operator", ">=")
          apigateway_integration_latency_p99       = lookup(attr_val, "apigateway_integration_latency_p99_critical", 1)
          apigateway_integration_latency     = lookup(attr_val, "apigateway_integration_latency_timeframe", "last_5m")
          apigateway_integration_latency      = lookup(attr_val, "apigateway_integration_latency_operator", ">=")
          apigateway_integration_latency      = lookup(attr_val, "apigateway_integration_latency_critical", 1)
          apigateway_integration_latency_maximum       = lookup(attr_val, "apigateway_integration_latency_maximum_timeframe", "last_5m")
          apigateway_integration_latency_maximum       = lookup(attr_val, "apigateway_integration_latency_maximum_operator", ">=")
          apigateway_integration_latency_maximum       = lookup(attr_val, "apigateway_integration_latency_maximum_critical", 1)
          apigateway_latency_p50       = lookup(attr_val, "apigateway.latency.p50_timeframe", "last_5m")
          apigateway_latency_p50       = lookup(attr_val, "apigateway.latency.p50_operator", ">=")
          apigateway_latency_p50       = lookup(attr_val, "apigateway.latency.p50_critical", 1)
          apigateway_latency_p75       = lookup(attr_val, "apigateway.latency.p75_timeframe", "last_5m")
          apigateway_latency_p75       = lookup(attr_val, "apigateway.latency.p75_operator", ">=")
          apigateway_latency_p75       = lookup(attr_val, "apigateway.latency.p75_critical", 1)
          apigateway_latency_p90      = lookup(attr_val, "apigateway.latency.p90_timeframe", "last_5m")
          apigateway_latency_p90       = lookup(attr_val, "apigateway.latency.p90_operator", ">=")
          apigateway_latency_p90       = lookup(attr_val, "apigateway.latency.p90_critical", 1)
          apigateway_latency_p95     = lookup(attr_val, "apigateway.latency.p95_timeframe", "last_5m")
          apigateway_latency_p95       = lookup(attr_val, "apigateway.latency.p95_operator", ">=")
          apigateway_latency_p95       = lookup(attr_val, "apigateway.latency.p95_critical", 1)
          apigateway_latency_p99     = lookup(attr_val, "apigateway.latency.p99_timeframe", "last_5m")
          apigateway_latency_p99     = lookup(attr_val, "apigateway.latency.p99_operator", ">=")
          apigateway_latency_p99       = lookup(attr_val, "apigateway.latency.p99_critical", 1)
          apigateway_latency     = lookup(attr_val, "apigateway.latency_timeframe", "last_5m")
          apigateway_latency     = lookup(attr_val, "apigateway.latency_operator", ">=")
          apigateway_latency     = lookup(attr_val, "apigateway.latency_critical", 1)

        }))
      }
    ]
  ])
  catalog_apigateway = { for item in local.catalog_apigateway_list : item.key => item.value }

  custom_apigateway_list = var.apigateway_monitor.enabled == true && var.apigateway_monitor.custom_monitors != null ? flatten([
    for key, val in var.apigateway_monitor.custom_monitors : [
      for attr_key, attr_val in var.apigateway_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_apigateway = {
    for item in local.custom_apigateway_list : item.id => jsondecode(templatefile(item.template, merge({
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
          name                               = lookup(attr_val, "name", attr_val.api_id)
          api_id                             = attr_val.api_id
          notification_targets               = lookup(attr_val, "notification_targets", var.notification_targets)
          apigatewayv2_4xx_timeframe         = lookup(attr_val, "apigatewayv2_4xx_timeframe", "last_5m")
          apigatewayv2_4xx_operator          = lookup(attr_val, "apigatewayv2_4xx_operator", ">=")
          apigatewayv2_4xx_critical          = lookup(attr_val, "apigatewayv2_4xx_critical", 1)
          apigatewayv2_4xx_critical_recovery = lookup(attr_val, "apigatewayv2_4xx_critical_recovery", 0)
          apigatewayv2_5xx_timeframe         = lookup(attr_val, "apigatewayv2_5xx_timeframe", "last_5m")
          apigatewayv2_5xx_operator          = lookup(attr_val, "apigatewayv2_5xx_operator", ">=")
          apigatewayv2_5xx_critical          = lookup(attr_val, "apigatewayv2_5xx_critical", 1)
          apigatewayv2_5xx_critical_recovery = lookup(attr_val, "apigatewayv2_5xx_critical_recovery", 0)
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
  # Cloudfront
  catalog_cloudfront_files         = [for filename in fileset("${path.module}/monitors/cloudfront/", "*.json") : trimsuffix(filename, ".json")]
  catalog_cloudfront_monitors_list = var.cloudfront_monitor.enabled == true ? local.catalog_cloudfront_files : []
  catalog_cloudfront_list = flatten([
    for item in local.catalog_cloudfront_monitors_list : [
      for attr_key, attr_val in var.cloudfront_monitor.attributes : {
        key = "${attr_key}/cloudfront/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/cloudfront/${item}.json", {
          name                                  = lookup(attr_val, "name", attr_val.distribution_id)
          distribution_id                       = attr_val.distribution_id
          notification_targets                  = lookup(attr_val, "notification_targets", var.notification_targets)
          cloudfront_4xxerror_timeframe         = lookup(attr_val, "cloudfront_4xxerror_timeframe", "last_5m")
          cloudfront_4xxerror_operator          = lookup(attr_val, "cloudfront_4xxerror_operator", ">=")
          cloudfront_4xxerror_critical          = lookup(attr_val, "cloudfront_4xxerror_critical", 1)
          cloudfront_4xxerror_critical_recovery = lookup(attr_val, "cloudfront_4xxerror_critical", 0)
          cloudfront_5xxerror_timeframe         = lookup(attr_val, "cloudfront_5xxerror_timeframe", "last_5m")
          cloudfront_5xxerror_operator          = lookup(attr_val, "cloudfront_5xxerror_operator", ">=")
          cloudfront_5xxerror_critical          = lookup(attr_val, "cloudfront_5xxerror_critical", 1)
          cloudfront_5xxerror_critical_recovery = lookup(attr_val, "cloudfront_5xxerror_critical", 0)
          cloudfront_bytes_downloaded_timeframe         = lookup(attr_val, "cloudfront_bytes_downloaded_timeframe", "last_5m")
          cloudfront_bytes_downloaded_operator          = lookup(attr_val, "cloudfront_bytes_downloaded_operator", ">=")
          cloudfront_bytes_downloaded_critical          = lookup(attr_val, "cloudfront_bytes_downloaded_critical", 1)
          cloudfront_bytes_uploaded_timeframe         = lookup(attr_val, "cloudfront_bytes_uploaded_timeframe", "last_5m")
          cloudfront_bytes_uploaded_operator          = lookup(attr_val, "cloudfront_bytes_uploaded_operator", ">=")
          cloudfront_bytes_uploaded_critical          = lookup(attr_val, "cloudfront_bytes_uploaded_critical", 1)
          cloudfront_requests_timeframe         = lookup(attr_val, "cloudfront_requests_timeframe", "last_5m")
          cloudfront_requests_operator          = lookup(attr_val, "cloudfront_requests_operator", ">=")
          cloudfront_requests_critical          = lookup(attr_val, "cloudfront_requests_critical", 1)
          cloudfront_total_error_rate_timeframe         = lookup(attr_val, "cloudfront_total_error_rate_timeframe", "last_5m")
          cloudfront_total_error_rate_operator          = lookup(attr_val, "cloudfront_total_error_rate_operator", ">=")
          cloudfront_total_error_rate_critical          = lookup(attr_val, "cloudfront_total_error_rate_critical", 1)




        }))
      }
    ]
  ])
  catalog_cloudfront = { for item in local.catalog_cloudfront_list : item.key => item.value }

  custom_cloudfront_list = var.cloudfront_monitor.enabled == true && var.cloudfront_monitor.custom_monitors != null ? flatten([
    for key, val in var.cloudfront_monitor.custom_monitors : [
      for attr_key, attr_val in var.cloudfront_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_cloudfront = {
    for item in local.custom_cloudfront_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # docdb
  catalog_docdb_files         = [for filename in fileset("${path.module}/monitors/docdb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_docdb_monitors_list = var.docdb_monitor.enabled == true ? local.catalog_docdb_files : []
  catalog_docdb_list = flatten([
    for item in local.catalog_docdb_monitors_list : [
      for attr_key, attr_val in var.docdb_monitor.attributes : {
        key = "${attr_key}/docdb/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/docdb/${item}.json", {
          db_cluster_identifier                               = attr_val.db_cluster_identifier
          notification_targets                                = lookup(attr_val, "notification_targets", var.notification_targets)
          docdb_cpu_utilization_timeframe                     = lookup(attr_val, "docdb_cpu_utilization_timeframe", "last_15m")
          docdb_cpu_utilization_operator                      = lookup(attr_val, "docdb_cpu_utilization_operator", ">")
          docdb_cpu_utilization_critical                      = lookup(attr_val, "docdb_cpu_utilization_critical", 80)
          docdb_backup_retention_period_timeframe             = lookup(attr_val, "docdb_backup_retention_period_timeframe", "last_15m")
          docdb_backup_retention_period_operator              = lookup(attr_val, "docdb_backup_retention_period_operator", ">")
          docdb_backup_retention_period_critical              = lookup(attr_val, "docdb_backup_retention_period_critical", 80)
          docdb_backup_retention_period_maximum_timeframe     = lookup(attr_val, "docdb_backup_retention_period_maximum_timeframe", "last_15m")
          docdb_backup_retention_period_maximum_operator      = lookup(attr_val, "docdb_backup_retention_period_maximum_operator", ">")
          docdb_backup_retention_period_maximum_critical      = lookup(attr_val, "docdb_backup_retention_period_maximum_critical", 80)
          docdb_backup_retention_period_minimum_timeframe     = lookup(attr_val, "docdb_backup_retention_period_minimum_timeframe", "last_15m")
          docdb_backup_retention_period_minimum_operator      = lookup(attr_val, "docdb_backup_retention_period_minimum_operator", ">")
          docdb_backup_retention_period_minimum_critical      = lookup(attr_val, "docdb_backup_retention_period_minimum_critical", 80)
          docdb_backup_retention_period_sum_timeframe         = lookup(attr_val, "docdb_backup_retention_period_sum_timeframe", "last_15m")
          docdb_backup_retention_period_sum_operator          = lookup(attr_val, "docdb_backup_retention_period_sum_operator", ">")
          docdb_backup_retention_period_sum_critical          = lookup(attr_val, "docdb_backup_retention_period_sum_critical", 80)
          docdb_backup_retention_period_samplecount_timeframe = lookup(attr_val, "docdb_backup_retention_period_samplecount_timeframe", "last_15m")
          docdb_backup_retention_period_samplecount_operator  = lookup(attr_val, "docdb_backup_retention_period_samplecount_operator", ">")
          docdb_backup_retention_period_samplecount_critical  = lookup(attr_val, "docdb_backup_retention_period_samplecount_critical", 80)
          docdb_backup_storage_billed_samplecount_timeframe   = lookup(attr_val, "docdb_backup_storage_billed_samplecount_timeframe", "last_15m")
          docdb_backup_storage_billed_samplecount_operator    = lookup(attr_val, "docdb_backup_storage_billed_samplecount_operator", ">")
          docdb_backup_storage_billed_samplecount_critical    = lookup(attr_val, "docdb_backup_storage_billed_samplecount_critical", 80)
          docdb_cpucredit_usage_timeframe                     = lookup(attr_val, "docdb_cpucredit_usage_timeframe", "last_15m")
          docdb_cpucredit_usage_operator                      = lookup(attr_val, "docdb_cpucredit_usage_operator", ">")
          docdb_cpucredit_usage_critical                      = lookup(attr_val, "docdb_cpucredit_usage_critical", 80)
          docdb_cpucredit_usage_maximum_timeframe             = lookup(attr_val, "docdb_cpucredit_usage_maximum_timeframe", "last_15m")
          docdb_cpucredit_usage_maximum_operator              = lookup(attr_val, "docdb_cpucredit_usage_maximum_operator", ">")
          docdb_cpucredit_usage_maximum_critical              = lookup(attr_val, "docdb_cpucredit_usage_maximum_critical", 80)
          docdb_cpucredit_usage_minimum_timeframe             = lookup(attr_val, "docdb_cpucredit_usage_minimum_timeframe", "last_15m")
          docdb_cpucredit_usage_minimum_operator              = lookup(attr_val, "docdb_cpucredit_usage_minimum_operator", ">")
          docdb_cpucredit_usage_minimum_critical              = lookup(attr_val, "docdb_cpucredit_usage_minimum_critical", 80)
          docdb_cpucredit_usage_sum_timeframe                 = lookup(attr_val, "docdb_cpucredit_usage_sum_timeframe", "last_15m")
          docdb_cpucredit_usage_sum_operator                  = lookup(attr_val, "docdb_cpucredit_usage_sum_operator", ">")
          docdb_cpucredit_usage_sum_critical                  = lookup(attr_val, "docdb_cpucredit_usage_sum_critical", 80)
          docdb_cpucredit_usage_samplecount_timeframe         = lookup(attr_val, "docdb_cpucredit_usage_samplecount_timeframe", "last_15m")
          docdb_cpucredit_usage_samplecount_operator          = lookup(attr_val, "docdb_cpucredit_usage_samplecount_operator", ">")
          docdb_cpucredit_usage_samplecount_critical          = lookup(attr_val, "docdb_cpucredit_usage_samplecount_critical", 80)
          docdb_cpucredit_balance_timeframe                   = lookup(attr_val, "docdb_cpucredit_balance_timeframe", "last_15m")
          docdb_cpucredit_balance_operator                    = lookup(attr_val, "docdb_cpucredit_balance_operator", ">")
          docdb_cpucredit_balance_critical                    = lookup(attr_val, "docdb_cpucredit_balance_critical", 80)
          docdb_cpucredit_balance_maximum_timeframe           = lookup(attr_val, "docdb_cpucredit_balance_maximum_timeframe", "last_15m")
          docdb_cpucredit_balance_maximum_operator            = lookup(attr_val, "docdb_cpucredit_balance_maximum_operator", ">")
          docdb_cpucredit_balance_maximum_critical            = lookup(attr_val, "docdb_cpucredit_balance_maximum_critical", 80)
          docdb_cpucredit_balance_minimum_timeframe           = lookup(attr_val, "docdb_cpucredit_balance_minimum_timeframe", "last_15m")
          docdb_cpucredit_balance_minimum_operator            = lookup(attr_val, "docdb_cpucredit_balance_minimum_operator", ">")
          docdb_cpucredit_balance_minimum_critical            = lookup(attr_val, "docdb_cpucredit_balance_minimum_critical", 80)
          docdb_cpucredit_balance_sum_timeframe               = lookup(attr_val, "docdb_cpucredit_balance_sum_timeframe", "last_15m")
          docdb_cpucredit_balance_sum_operator                = lookup(attr_val, "docdb_cpucredit_balance_sum_operator", ">")
          docdb_cpucredit_balance_sum_critical                = lookup(attr_val, "docdb_cpucredit_balance_sum_critical", 80)
          docdb_cpucredit_balance_samplecount_timeframe       = lookup(attr_val, "docdb_cpucredit_balance_samplecount_timeframe", "last_15m")
          docdb_cpucredit_balance_samplecount_operator        = lookup(attr_val, "docdb_cpucredit_balance_samplecount_operator", ">")
          docdb_cpucredit_balance_samplecount_critical        = lookup(attr_val, "docdb_cpucredit_balance_samplecount_critical", 80)
          docdb_cpusurplus_credit_balance_timeframe           = lookup(attr_val, "docdb_cpusurplus_credit_balance_timeframe", "last_15m")
          docdb_cpusurplus_credit_balance_operator            = lookup(attr_val, "docdb_cpusurplus_credit_balance_operator", ">")
          docdb_cpusurplus_credit_balance_critical            = lookup(attr_val, "docdb_cpusurplus_credit_balance_critical", 80)
          docdb_cpusurplus_credit_balance_maximum_timeframe   = lookup(attr_val, "docdb_cpusurplus_credit_balance_maximum_timeframe", "last_15m")
          docdb_cpusurplus_credit_balance_maximum_operator    = lookup(attr_val, "docdb_cpusurplus_credit_balance_maximum_operator", ">")
          docdb_cpusurplus_credit_balance_maximum_critical    = lookup(attr_val, "docdb_cpusurplus_credit_balance_maximum_critical", 80)
        }))
      }
    ]
  ])
  catalog_docdb = { for item in local.catalog_docdb_list : item.key => item.value }

  custom_docdb_list = var.docdb_monitor.enabled == true && var.docdb_monitor.custom_monitors != null ? flatten([
    for key, val in var.docdb_monitor.custom_monitors : [
      for attr_key, attr_val in var.docdb_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_docdb = {
    for item in local.custom_docdb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # dynamodb
  catalog_dynamodb_files         = [for filename in fileset("${path.module}/monitors/dynamodb/", "*.json") : trimsuffix(filename, ".json")]
  catalog_dynamodb_monitors_list = var.dynamodb_monitor.enabled == true ? local.catalog_dynamodb_files : []
  catalog_dynamodb_list = flatten([
    for item in local.catalog_dynamodb_monitors_list : [
      for attr_key, attr_val in var.dynamodb_monitor.attributes : {
        key = "${attr_key}/dynamodb/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/dynamodb/${item}.json", {
          table_name                                                = attr_val.table_name
          account_max_reads_critical                                = lookup(attr_val, "account_max_reads_critical", 0)
          account_max_reads_operator                                = lookup(attr_val, "account_max_reads_operator", "<")
          account_max_table_level_reads_critical                    = lookup(attr_val, "account_max_table_level_reads_critical", 0)
          account_max_table_level_reads_operator                    = lookup(attr_val, "account_max_table_level_reads_operator", "<")
          account_max_writes_critical                               = lookup(attr_val, "account_max_writes_critical", 0)
          account_max_writes_operator                               = lookup(attr_val, "account_max_writes_operator", "<")
          account_provisioned_read_capacity_utilization_critical    = lookup(attr_val, "account_provisioned_read_capacity_utilization_critical", 0)
          account_provisioned_read_capacity_utilization_operator    = lookup(attr_val, "account_provisioned_read_capacity_utilization_operator", ">")
          account_provisioned_write_capacity_utilization_critical   = lookup(attr_val, "account_provisioned_write_capacity_utilization_critical", 0)
          account_provisioned_write_capacity_utilization_operator   = lookup(attr_val, "account_provisioned_write_capacity_utilization_operator", ">")
          conditional_check_failed_requests_critical                = lookup(attr_val, "conditional_check_failed_requests_critical", 0)
          conditional_check_failed_requests_operator                = lookup(attr_val, "conditional_check_failed_requests_operator", ">")
          consumed_read_capacity_units_critical                     = lookup(attr_val, "consumed_read_capacity_units_critical", 0)
          consumed_read_capacity_units_operator                     = lookup(attr_val, "consumed_read_capacity_units_operator", "<")
          consumed_write_capacity_units_critical                    = lookup(attr_val, "consumed_write_capacity_units_critical", 0)
          consumed_write_capacity_units_operator                    = lookup(attr_val, "consumed_write_capacity_units_operator", "<")
          global_secondary_indexes_index_size_bytes_critical        = lookup(attr_val, "global_secondary_indexes_index_size_bytes_critical", 0)
          global_secondary_indexes_index_size_bytes_operator        = lookup(attr_val, "global_secondary_indexes_index_size_bytes_operator", "<")
          global_secondary_indexes_item_count_critical              = lookup(attr_val, "global_secondary_indexes_item_count_critical", 0)
          global_secondary_indexes_item_count_operator              = lookup(attr_val, "global_secondary_indexes_item_count_operator", "<")
          item_count_critical                                       = lookup(attr_val, "item_count_critical", 0)
          item_count_operator                                       = lookup(attr_val, "item_count_operator", "<")
          max_provisioned_table_read_capacity_utilization_critical  = lookup(attr_val, "max_provisioned_table_read_capacity_utilization_critical", 0)
          max_provisioned_table_read_capacity_utilization_operator  = lookup(attr_val, "max_provisioned_table_read_capacity_utilization_operator", "<")
          max_provisioned_table_write_capacity_utilization_critical = lookup(attr_val, "max_provisioned_table_write_capacity_utilization_critical", 0)
          max_provisioned_table_write_capacity_utilization_operator = lookup(attr_val, "max_provisioned_table_write_capacity_utilization_operator", "<")
          online_index_percentage_progress_critical                 = lookup(attr_val, "online_index_percentage_progress_critical", 0)
          online_index_percentage_progress_operator                 = lookup(attr_val, "online_index_percentage_progress_operator", "<")
          online_index_throttle_events_critical                     = lookup(attr_val, "online_index_throttle_events_critical", 0)
          online_index_throttle_events_operator                     = lookup(attr_val, "online_index_throttle_events_operator", "<")
          read_throttle_events_critical                             = lookup(attr_val, "read_throttle_events_critical", 0)
          read_throttle_events_operator                             = lookup(attr_val, "read_throttle_events_operator", ">")
          returned_item_count_maximum_critical                      = lookup(attr_val, "returned_item_count_maximum_critical", 0)
          returned_item_count_maximum_operator                      = lookup(attr_val, "returned_item_count_maximum_operator", "<")
          successful_request_latency_critical                       = lookup(attr_val, "successful_request_latency_critical", 0)
          successful_request_latency_operator                       = lookup(attr_val, "successful_request_latency_operator", "<")
          system_errors_critical                                    = lookup(attr_val, "system_errors_critical", 0)
          system_errors_operator                                    = lookup(attr_val, "system_errors_operator", ">")
          table_size_critical                                       = lookup(attr_val, "table_size_critical", 0)
          table_size_operator                                       = lookup(attr_val, "table_size_operator", "<")
          throttled_requests_critical                               = lookup(attr_val, "throttled_requests_critical", 0)
          throttled_requests_operator                               = lookup(attr_val, "throttled_requests_operator", "<")
          time_to_live_deleted_item_count_critical                  = lookup(attr_val, "time_to_live_deleted_item_count_critical", 0)
          time_to_live_deleted_item_count_operator                  = lookup(attr_val, "time_to_live_deleted_item_count_operator", "<")
          user_errors_critical                                      = lookup(attr_val, "user_errors_critical", 0)
          user_errors_operator                                      = lookup(attr_val, "user_errors_operator", ">")
          write_throttle_events_critical                            = lookup(attr_val, "write_throttle_events_critical", 0)
          write_throttle_events_operator                            = lookup(attr_val, "write_throttle_events_operator", ">")
          notification_targets                                      = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_dynamodb = { for item in local.catalog_dynamodb_list : item.key => item.value }

  custom_dynamodb_list = var.dynamodb_monitor.enabled == true && var.dynamodb_monitor.custom_monitors != null ? flatten([
    for key, val in var.dynamodb_monitor.custom_monitors : [
      for attr_key, attr_val in var.dynamodb_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_dynamodb = {
    for item in local.custom_dynamodb_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # ECS 
  catalog_ecs_files         = [for filename in fileset("${path.module}/monitors/ecs/", "*.json") : trimsuffix(filename, ".json")]
  catalog_ecs_monitors_list = var.ecs_monitor.enabled == true ? local.catalog_ecs_files : []
  catalog_ecs_list = flatten([
    for item in local.catalog_ecs_monitors_list : [
      for attr_key, attr_val in var.ecs_monitor.attributes : {
        key = "${attr_key}/ecs/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/ecs/${item}.json", {
          service_name                              = attr_val.service_name
          runbook_url                               = lookup(attr_val, "runbook_url", "")
          notification_targets                      = lookup(attr_val, "notification_targets", var.notification_targets)
          ecs_cpu_utilization_timeframe             = lookup(attr_val, "ecs_cpu_utilization_timeframe", "last_15m")
          ecs_cpu_utilization_operator              = lookup(attr_val, "ecs_cpu_utilization_operator", ">")
          ecs_cpu_utilization_critical_threshold    = lookup(attr_val, "ecs_cpu_utilization_critical_threshold", 80)
          ecs_memory_utilization_timeframe          = lookup(attr_val, "ecs_memory_utilization_timeframe", "last_15m")
          ecs_memory_utilization_operator           = lookup(attr_val, "ecs_memory_utilization_operator", ">")
          ecs_memory_utilization_critical_threshold = lookup(attr_val, "ecs_memory_utilization_critical_threshold", 80)
          ecs_running_instance_timeframe            = lookup(attr_val, "ecs_running_instance_timeframe", "last_5m")
          ecs_running_instance_operator             = lookup(attr_val, "ecs_running_instance_operator", "<=")
          ecs_running_instance_critical             = lookup(attr_val, "ecs_running_instance_critical", 0)
          ecs_cluster_cpureservation_timeframe            = lookup(attr_val, "ecs_cluster_cpureservation_timeframe", "last_5m")
          ecs_cluster_cpureservation_operator             = lookup(attr_val, "ecs_cluster_cpureservation_operator", "<=")
          ecs_cluster_cpureservation_critical                   = lookup(attr_val, "ecs_cluster_cpureservation_critical", 0)
          ecs_cluster_cpureservation_maximum_timeframe            = lookup(attr_val, "ecs_cluster_cpureservation_maximum_timeframe", "last_5m")
          ecs_cluster_cpureservation_maximum_operator             = lookup(attr_val, "ecs_cluster_cpureservation_maximum_operator", "<=")
          ecs_cluster_cpureservation_maximum_critical             = lookup(attr_val, "ecs_cluster_cpureservation_maximum_critical", 0)
          ecs_cluster_cpureservation_minimum_timeframe            = lookup(attr_val, "ecs_cluster_cpureservation_minimum_timeframe", "last_5m")
          ecs_cluster_cpureservation_minimum_operator             = lookup(attr_val, "ecs_cluster_cpureservation_minimum_operator", "<=")
          ecs_cluster_cpureservation_minimum_critical             = lookup(attr_val, "ecs_cluster_cpureservation_minimum_critical", 0)
          ecs_cluster_cpuutilization_timeframe            = lookup(attr_val, "ecs_cluster_cpuutilization_timeframe", "last_5m")
          ecs_cluster_cpuutilization_operator             = lookup(attr_val, "ecs_cluster_cpuutilization_operator", "<=")
          ecs_cluster_cpuutilization_critical             = lookup(attr_val, "ecs_cluster_cpuutilization_critical", 0)
          ecs_cluster_cpuutilization_maximum_timeframe            = lookup(attr_val, "ecs_cluster_cpuutilization_maximum_timeframe", "last_5m")
          ecs_cluster_cpuutilization_maximum_operator             = lookup(attr_val, "ecs_cluster_cpuutilization_maximum_operator", "<=")
          ecs_cluster_cpuutilization_maximum_critical             = lookup(attr_val, "ecs_cluster_cpuutilization_maximum_critical", 0)
          ecs_cluster_cpuutilization_minimum_timeframe            = lookup(attr_val, "ecs_cluster_cpuutilization_minimum_timeframe", "last_5m")
          ecs_cluster_cpuutilization_minimum_operator             = lookup(attr_val, "ecs_cluster_cpuutilization_minimum_operator", "<=")
          ecs_cluster_cpuutilization_minimum_critical             = lookup(attr_val, "ecs_cluster_cpuutilization_minimum_critical", 0)
          ecs_cluster_memory_reservation_timeframe            = lookup(attr_val, "ecs_cluster_memory_reservation_timeframe", "last_5m")
          ecs_cluster_memory_reservation_operator             = lookup(attr_val, "ecs_cluster_memory_reservation_operator", "<=")
          ecs_cluster_memory_reservation_critical             = lookup(attr_val, "ecs_cluster_memory_reservation_critical", 0)
          ecs_cluster_memory_reservation_maximum_timeframe            = lookup(attr_val, "ecs_cluster_memory_reservation_maximum_timeframe", "last_5m")
          ecs_cluster_memory_reservation_maximum_operator             = lookup(attr_val, "ecs_cluster_memory_reservation_maximum_operator", "<=")
          ecs_cluster_memory_reservation_maximum_critical             = lookup(attr_val, "ecs_cluster_memory_reservation_maximum_critical", 0)
          ecs_cluster_memory_reservation_minimum_timeframe            = lookup(attr_val, "ecs_cluster_memory_reservation_minimum_timeframe", "last_5m")
          ecs_cluster_memory_reservation_minimum_operator             = lookup(attr_val, "ecs_cluster_memory_reservation_minimum_operator", "<=")
          ecs_cluster_memory_reservation_minimum_critical             = lookup(attr_val, "ecs_cluster_memory_reservation_minimum_critical", 0)
          ecs_cluster_memory_utilization_timeframe            = lookup(attr_val, "ecs_cluster_memory_utilization_timeframe", "last_5m")
          ecs_cluster_memory_utilization_operator             = lookup(attr_val, "ecs_cluster_memory_utilization_operator", "<=")
          ecs_cluster_memory_utilization_critical             = lookup(attr_val, "ecs_ecs_cluster_memory_utilization_critical", 0)
          ecs_cluster_memory_utilization_maximum_timeframe            = lookup(attr_val, "ecs_cluster_memory_utilization_maximum_timeframe", "last_5m")
          ecs_cluster_memory_utilization_maximum_operator             = lookup(attr_val, "ecs_cluster_memory_utilization_maximum_operator", "<=")
          ecs_cluster_memory_utilization_maximum_critical             = lookup(attr_val, "ecs_cluster_memory_utilization_maximum_critical", 0)
          ecs_cluster_memory_utilization_minimum_timeframe            = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_timeframe", "last_5m")
          ecs_cluster_memory_utilization_minimum_operator             = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_operator", "<=")
          ecs_cluster_memory_utilization_minimum_critical             = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_critical", 0)
          ecs_cpureservation_maximum_timeframe            = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_timeframe", "last_5m")
          ecs_cpureservation_maximum_operator             = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_operator", "<=")
          ecs_cpureservation_maximum_critical             = lookup(attr_val, "ecs_cluster_memory_utilization_minimum_critical", 0)
          ecs_cpureservation_timeframe            = lookup(attr_val, " ecs_cpureservation_timeframe", "last_5m")
          ecs_cpureservation_operator             = lookup(attr_val, " ecs_cpureservation_operator", "<=")
          ecs_cpureservation_critical             = lookup(attr_val, " ecs_cpureservation_critical", 0)
          ecs_cpureservation_minimum_timeframe            = lookup(attr_val, " ecs_cpureservation_minimum_timeframe", "last_5m")
          ecs_cpureservation_minimum_operator             = lookup(attr_val, " ecs_cpureservation_minimum_operator", "<=")
          ecs_cpureservation_minimum_critical             = lookup(attr_val, " ecs_cpureservation_minimum_critical", 0)
          ecs_cpuutilization_timeframe            = lookup(attr_val, " ecs_cpuutilization_timeframe", "last_5m")
          ecs_cpuutilization_operator             = lookup(attr_val, " ecs_cpuutilization_operator", "<=")
          ecs_cpuutilization_critical             = lookup(attr_val, " ecs_cpuutilization_critical", 0)
          ecs_cpuutilization_maximum_timeframe            = lookup(attr_val, " ecs_cpuutilization_maximum_timeframe", "last_5m")
          ecs_cpuutilization_maximum_operator             = lookup(attr_val, " ecs_cpuutilization_maximum_operator", "<=")
          ecs_cpuutilization_maximum_critical             = lookup(attr_val, " ecs_cpuutilization_maximum_critical", 0)
          ecs_cpuutilization_minimum_timeframe            = lookup(attr_val, " ecs_cpuutilization_minimum_timeframe", "last_5m")
          ecs_cpuutilization_minimum_operator             = lookup(attr_val, " ecs_cpuutilization_minimum_operator", "<=")
          ecs_cpuutilization_minimum_critical             = lookup(attr_val, " ecs_cpuutilization_minimum_critical", 0)
          ecs_memory_reservation_timeframe            = lookup(attr_val, " ecs_memory_reservation_timeframe", "last_5m")
          ecs_memory_reservation_operator             = lookup(attr_val, " ecs_memory_reservation_operator", "<=")
          ecs_memory_reservation_critical             = lookup(attr_val, " ecs_memory_reservation_critical", 0)
          ecs_memory_reservation_maximum_timeframe            = lookup(attr_val, " ecs_memory_reservation_maximum_timeframe", "last_5m")
          ecs_memory_reservation_maximum_operator             = lookup(attr_val, " ecs_memory_reservation_maximum_operator", "<=")
          ecs_memory_reservation_maximum_critical             = lookup(attr_val, " ecs_memory_reservation_maximum_critical", 0)
          ecs_memory_reservation_minimum_timeframe            = lookup(attr_val, " ecs_memory_reservation_minimum_timeframe", "last_5m")
          ecs_memory_reservation_minimum_operator             = lookup(attr_val, " ecs_memory_reservation_minimum_operator", "<=")
          ecs_memory_reservation_minimum_critical             = lookup(attr_val, "  ecs_memory_reservation_minimum_critical", 0)
          ecs_memory_utilization_timeframe            = lookup(attr_val, " ecs_memory_utilization_timeframe", "last_5m")
          ecs_memory_utilization_operator             = lookup(attr_val, " ecs_memory_utilization_operator", "<=")
          ecs_memory_utilization_critical             = lookup(attr_val, "  ecs_memory_utilization_critical", 0)
          ecs_memory_utilization_maximum_timeframe            = lookup(attr_val, "  ecs_memory_utilization_maximum_timeframe", "last_5m")
          ecs_memory_utilization_maximum_operator             = lookup(attr_val, "  ecs_memory_utilization_maximum_operator", "<=")
          ecs_memory_utilization_maximum_critical             = lookup(attr_val, "   ecs_memory_utilization_maximum_critical", 0)
          ecs_memory_utilization_minimum_timeframe            = lookup(attr_val, "  ecs_memory_utilization_minimum_timeframe", "last_5m")
          ecs_memory_utilization_minimum_operator             = lookup(attr_val, "  ecs_memory_utilization_minimum_operator", "<=")
          ecs_memory_utilization_minimum_critical             = lookup(attr_val, "  ecs_memory_utilization_minimum_critical", 0)
          ecs_pending_tasks_count_timeframe            = lookup(attr_val, "  ecs_pending_tasks_count_timeframe", "last_5m")
          ecs_pending_tasks_count_operator             = lookup(attr_val, "  ecs_pending_tasks_count_operator", "<=")
          ecs_pending_tasks_count_critical             = lookup(attr_val, "  ecs_pending_tasks_count_critical", 0)
          ecs_registered_cpu_timeframe            = lookup(attr_val, "  ecs_registered_cpu_timeframe", "last_5m")
          ecs_registered_cpu_operator             = lookup(attr_val, "  ecs_registered_cpu_operator", "<=")
          ecs_registered_cpu_critical             = lookup(attr_val, "  ecs_registered_cpu_count_critical", 0)
          ecs_registered_memory_timeframe            = lookup(attr_val, "  ecs_registered_memory_timeframe", "last_5m")
          ecs_registered_memory_operator             = lookup(attr_val, "  ecs_registered_memory_operator", "<=")
          ecs_registered_memory_critical             = lookup(attr_val, "  ecs_registered_memory_critical", 0)
          ecs_remaining_cpu_timeframe            = lookup(attr_val, "  ecs_remaining_cpu_timeframe", "last_5m")
          ecs_remaining_cpu_operator             = lookup(attr_val, "  ecs_remaining_cpu_operator", "<=")
          ecs_remaining_cpu_critical             = lookup(attr_val, "  ecs_remaining_cpu_critical", 0)
          ecs_running_tasks_count_timeframe            = lookup(attr_val, "  ecs_running_tasks_count_timeframe", "last_5m")
          ecs_running_tasks_count_operator             = lookup(attr_val, "  ecs_running_tasks_count_operator", "<=")
          ecs_running_tasks_count_critical             = lookup(attr_val, "  ecs_running_tasks_count_critical", 0)
          ecs_service_cpuutilization_timeframe            = lookup(attr_val, "  ecs_service_cpuutilization_timeframe", "last_5m")
          ecs_service_cpuutilization_operator             = lookup(attr_val, "  ecs_service_cpuutilization_operator", "<=")
          ecs_service_cpuutilization_critical             = lookup(attr_val, "  ecs_service_cpuutilization_critical", 0)
          ecs_service_cpuutilization_maximum_timeframe            = lookup(attr_val, "   ecs_service_cpuutilization_maximum_timeframe", "last_5m")
          ecs_service_cpuutilization_maximum_operator             = lookup(attr_val, "   ecs_service_cpuutilization_maximum_operator", "<=")
          ecs_service_cpuutilization_maximum_critical             = lookup(attr_val, "   ecs_service_cpuutilization_maximum_critical", 0)



        }))
      }
    ]
  ])
  catalog_ecs = { for item in local.catalog_ecs_list : item.key => item.value }

  custom_ecs_list = var.ecs_monitor.enabled == true && var.ecs_monitor.custom_monitors != null ? flatten([
    for key, val in var.ecs_monitor.custom_monitors : [
      for attr_key, attr_val in var.ecs_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_ecs = {
    for item in local.custom_ecs_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # lambda 
  catalog_lambda_files         = [for filename in fileset("${path.module}/monitors/lambda/", "*.json") : trimsuffix(filename, ".json")]
  catalog_lambda_monitors_list = var.lambda_monitor.enabled == true ? local.catalog_lambda_files : []
  catalog_lambda_list = flatten([
    for item in local.catalog_lambda_monitors_list : [
      for attr_key, attr_val in var.lambda_monitor.attributes : {
        key = "${attr_key}/lambda/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/lambda/${item}.json", {
          function_name                                                  = attr_val.function_name
          notification_targets                                           = lookup(attr_val, "notification_targets", var.notification_targets)
          lambda_throttles_timeframe                                     = lookup(attr_val, "lambda_throttles_timeframe", "last_15m")
          lambda_throttles_operator                                      = lookup(attr_val, "lambda_throttles_operator", ">")
          lambda_throttles_critical                                      = lookup(attr_val, "lambda_throttles_critical", 100)
          lambda_duration_critical                                       = lookup(attr_val, "lambda_duration_critical", 100)
          lambda_duration_timeframe                                      = lookup(attr_val, "lambda_duration_timeframe", "last_15m")
          lambda_duration_operator                                       = lookup(attr_val, "lambda_duration_operator", ">")
          lambda_duration_maximum_critical                               = lookup(attr_val, "lambda_duration_maximum_critical", 100)
          lambda_duration_maximum_timeframe                              = lookup(attr_val, "lambda_duration_maximum_timeframe", "last_15m")
          lambda_duration_maximum_operator                               = lookup(attr_val, "lambda_duration_maximum_operator", ">")
          lambda_enhanced_duration_critical                              = lookup(attr_val, "lambda_enhanced_duration_critical", 100)
          lambda_enhanced_duration_timeframe                             = lookup(attr_val, "lambda_enhanced_duration_timeframe", "last_15m")
          lambda_enhanced_duration_operator                              = lookup(attr_val, "lambda_enhanced_duration_operator", ">")
          lambda_enhanced_init_duration_critical                         = lookup(attr_val, "lambda_enhanced_init_duration_critical", 100)
          lambda_enhanced_init_duration_timeframe                        = lookup(attr_val, "lambda_enhanced_init_duration_timeframe", "last_15m")
          lambda_enhanced_init_duration_operator                         = lookup(attr_val, "lambda_enhanced_init_duration_operator", ">")
          lambda_enhanced_max_memory_used_critical                       = lookup(attr_val, "lambda_enhanced_max_memory_used_critical", 100)
          lambda_enhanced_max_memory_used_timeframe                      = lookup(attr_val, "lambda_enhanced_max_memory_used_timeframe", "last_15m")
          lambda_enhanced_max_memory_used_operator                       = lookup(attr_val, "lambda_enhanced_max_memory_used_operator", ">")
          lambda_enhanced_out_of_memory_critical                         = lookup(attr_val, "lambda_enhanced_out_of_memory_critical", 100)
          lambda_enhanced_out_of_memory_timeframe                        = lookup(attr_val, "lambda_enhanced_out_of_memory_timeframe", "last_15m")
          lambda_enhanced_out_of_memory_operator                         = lookup(attr_val, "lambda_enhanced_out_of_memory_operator", ">")
          lambda_errors_critical                                         = lookup(attr_val, "lambda_errors_critical", 100)
          lambda_errors_timeframe                                        = lookup(attr_val, "lambda_errors_timeframe", "last_15m")
          lambda_errors_operator                                         = lookup(attr_val, "lambda_errors_operator", ">")
          lambda_enhanced_estimated_cost_critical                        = lookup(attr_val, "lambda_enhanced_estimated_cost_critical", 100)
          lambda_enhanced_estimated_cost_timeframe                       = lookup(attr_val, "lambda_enhanced_estimated_cost_timeframe", "last_15m")
          lambda_enhanced_estimated_cost_operator                        = lookup(attr_val, "lambda_enhanced_estimated_cost_operator", ">")
          lambda_hits_critical                                           = lookup(attr_val, "lambda_hits_critical", 100)
          lambda_hits_timeframe                                          = lookup(attr_val, "lambda_hits_timeframe", "last_15m")
          lambda_hits_operator                                           = lookup(attr_val, "lambda_hits_operator", ">")
          lambda_duration_minimum_critical                               = lookup(attr_val, "lambda_duration_minimum_critical", 100)
          lambda_duration_minimum_timeframe                              = lookup(attr_val, "lambda_duration_minimum_timeframe", "last_15m")
          lambda_duration_minimum_operator                               = lookup(attr_val, "lambda_duration_minimum_operator", ">")
          lambda_duration_sum_critical                                   = lookup(attr_val, "lambda_duration_sum_critical", 100)
          lambda_duration_sum_timeframe                                  = lookup(attr_val, "lambda_duration_sum_timeframe", "last_15m")
          lambda_duration_sum_operator                                   = lookup(attr_val, "lambda_duration_sum_operator", ">")
          lambda_duration_p50_critical                                   = lookup(attr_val, "lambda_duration_p50_critical", 100)
          lambda_duration_p50_timeframe                                  = lookup(attr_val, "lambda_duration_p50_timeframe", "last_15m")
          lambda_duration_p50_operator                                   = lookup(attr_val, "lambda_duration_p50_operator", ">")
          lambda_duration_p80_critical                                   = lookup(attr_val, "lambda_duration_p80_critical", 100)
          lambda_duration_p80_timeframe                                  = lookup(attr_val, "lambda_duration_p80_timeframe", "last_15m")
          lambda_duration_p80_operator                                   = lookup(attr_val, "lambda_duration_p80_operator", ">")
          lambda_memorysize_critical                                     = lookup(attr_val, "lambda_memorysize_critical", 100)
          lambda_memorysize_timeframe                                    = lookup(attr_val, "lambda_memorysize_timeframe", "last_15m")
          lambda_memorysize_operator                                     = lookup(attr_val, "lambda_memorysize_operator", ">")
          lambda_enhanced_max_memory_used_critical                       = lookup(attr_val, "lambda_enhanced_max_memory_used_critical", 100)
          lambda_enhanced_max_memory_used_timeframe                      = lookup(attr_val, "lambda_enhanced_max_memory_used_timeframe", "last_15m")
          lambda_enhanced_max_memory_used_operator                       = lookup(attr_val, "lambda_enhanced_max_memory_used_operator", ">")
          lambda_invocations_critical                                    = lookup(attr_val, "lambda_invocations_critical", 100)
          lambda_invocations_timeframe                                   = lookup(attr_val, "lambda_invocations_timeframe", "last_15m")
          lambda_invocations_operator                                    = lookup(attr_val, "lambda_invocations_operator", ">")
          lambda_enhanced_invocations_critical                           = lookup(attr_val, "lambda_enhanced_invocations_critical", 100)
          lambda_enhanced_invocations_timeframe                          = lookup(attr_val, "lambda_enhanced_invocations_timeframe", "last_15m")
          lambda_enhanced_invocations_operator                           = lookup(attr_val, "lambda_enhanced_invocations_operator", ">")
          lambda_provisioned_concurrency_invocations_critical            = lookup(attr_val, "lambda_provisioned_concurrency_invocations_critical", 100)
          lambda_provisioned_concurrency_invocations_timeframe           = lookup(attr_val, "lambda_provisioned_concurrency_invocations_timeframe", "last_15m")
          lambda_provisioned_concurrency_invocations_operator            = lookup(attr_val, "lambda_provisioned_concurrency_invocations_operator", ">")
          lambda_provisioned_concurrency_utilization_critical            = lookup(attr_val, "lambda_provisioned_concurrency_utilization_critical", 100)
          lambda_provisioned_concurrency_utilization_timeframe           = lookup(attr_val, "lambda_provisioned_concurrency_utilization_timeframe", "last_15m")
          lambda_provisioned_concurrency_utilization_operator            = lookup(attr_val, "lambda_provisioned_concurrency_utilization_operator", ">")
          lambda_provisioned_concurrent_executions_critical              = lookup(attr_val, "lambda_provisioned_concurrent_executions_critical", 100)
          lambda_provisioned_concurrent_executions_timeframe             = lookup(attr_val, "lambda_provisioned_concurrent_executions_timeframe", "last_15m")
          lambda_provisioned_concurrent_executions_operator              = lookup(attr_val, "lambda_provisioned_concurrent_executions_operator", ">")
          lambda_provisioned_concurrency_spillover_invocations_critical  = lookup(attr_val, "lambda_provisioned_concurrency_spillover_invocations_critical", 100)
          lambda_provisioned_concurrency_spillover_invocations_timeframe = lookup(attr_val, "lambda_provisioned_concurrency_spillover_invocations_timeframe", "last_15m")
          lambda_provisioned_concurrency_spillover_invocations_operator  = lookup(attr_val, "lambda_provisioned_concurrency_spillover_invocations_operator", ">")
          lambda_enhanced_timeouts_critical                              = lookup(attr_val, "lambda_enhanced_timeouts_critical", 100)
          lambda_enhanced_timeouts_timeframe                             = lookup(attr_val, "lambda_enhanced_timeouts_timeframe", "last_15m")
          lambda_enhanced_timeouts_operator                              = lookup(attr_val, "lambda_enhanced_timeouts_operator", ">")
          lambda_unreserved_concurrent_executions_critical               = lookup(attr_val, "lambda_unreserved_concurrent_executions_critical", 100)
          lambda_unreserved_concurrent_executions_timeframe              = lookup(attr_val, "lambda_unreserved_concurrent_executions_timeframe", "last_15m")
          lambda_unreserved_concurrent_executions_operator               = lookup(attr_val, "lambda_unreserved_concurrent_executions_operator", ">")
          lambda_concurrent_executions_global_minimum_critical           = lookup(attr_val, "lambda_concurrent_executions_global_minimum_critical", 100)
          lambda_concurrent_executions_global_minimum_timeframe          = lookup(attr_val, "lambda_concurrent_executions_global_minimumtimeframe", "last_15m")
          lambda_concurrent_executions_global_minimum_operator           = lookup(attr_val, "lambda_concurrent_executions_global_minimumj_operator", ">")
          lambda_concurrent_executions_global_maximum_critical           = lookup(attr_val, "lambda_concurrent_executions_global_maximum_critical", 100)
          lambda_concurrent_executions_global_maximum_timeframe          = lookup(attr_val, "lambda_concurrent_executions_global_maximum_timeframe", "last_15m")
          lambda_concurrent_executions_global_maximum_operator           = lookup(attr_val, "lambda_concurrent_executions_global_maximum_operator", ">")
          lambda_concurrent_executions_sum_critical                      = lookup(attr_val, "lambda_concurrent_executions_sum_critical", 100)
          lambda_concurrent_executions_sum_timeframe                     = lookup(attr_val, "lambda_concurrent_executions_sum_timeframe", "last_15m")
          lambda_concurrent_executions_sum_operator                      = lookup(attr_val, "lambda_concurrent_executions_sum_operator", ">")
          lambda_duration_p95_critical                                   = lookup(attr_val, "lambda_duration_p95_critical", 100)
          lambda_duration_p95_timeframe                                  = lookup(attr_val, "lambda_duration_p95_timeframe", "last_15m")
          lambda_duration_p95_operator                                   = lookup(attr_val, "lambda_duration_p95_operator", ">")
          lambda_duration_p99_critical                                   = lookup(attr_val, "lambda_duration_p99_critical", 100)
          lambda_duration_p99_timeframe                                  = lookup(attr_val, "lambda_duration_p99_timeframe", "last_15m")
          lambda_duration_p99_operator                                   = lookup(attr_val, "lambda_duration_p99_operator", ">")
          lambda_enhanced_billed_duration_critical                       = lookup(attr_val, "lambda_enhanced_billed_duration_critical", 100)
          lambda_enhanced_billed_duration_timeframe                      = lookup(attr_val, "lambda_enhanced_billed_duration", "last_15m")
          lambda_enhanced_billed_duration_operator                       = lookup(attr_val, "lambda_duration_p95_operator", ">")
          lambda_provisioned_concurrency_utilization_maximum_critical    = lookup(attr_val, "lambda_provisioned_concurrency_utilization_maximum_critical", 100)
          lambda_provisioned_concurrency_utilization_maximum_timeframe   = lookup(attr_val, "lambda_provisioned_concurrency_utilization_maximum_duration", "last_15m")
          lambda_provisioned_concurrency_utilization_maximum_operator    = lookup(attr_val, "lambda_provisioned_concurrency_utilization_maximum_operator", ">")
          lambda_provisioned_concurrency_utilization_minimum_critical    = lookup(attr_val, "lambda_provisioned_concurrency_utilization_minimum_critical", 100)
          lambda_provisioned_concurrency_utilization_minimum_timeframe   = lookup(attr_val, "lambda_provisioned_concurrency_utilization_minimum_duration", "last_15m")
          lambda_provisioned_concurrency_utilization_minimum_operator    = lookup(attr_val, "lambda_provisioned_concurrency_utilization_minimum_operator", ">") 
          lambda_throttles_critical                                      = lookup(attr_val, "lambda_throttles_critical", 100)
          lambda_throttles_timeframe                                     = lookup(attr_val, "lambda_throttles_duration", "last_15m")
          lambda_throttles_operator                                      = lookup(attr_val, "lambda_throttles_operator", ">") 
          lambda_timeout_critical                                        = lookup(attr_val, "lambda_timeout_critical", 100)
          lambda_timeout_timeframe                                       = lookup(attr_val, "lambda_timeout_duration", "last_15m")
          lambda_timeout_operator                                        = lookup(attr_val, "lambda_timeout_operator", ">") 
          lambda_unreserved_concurrent_executions_critical               = lookup(attr_val, "lambda_unreserved_concurrent_executions_critical", 100)
          lambda_unreserved_concurrent_executions_timeframe              = lookup(attr_val, "lambda_unreserved_concurrent_executions_duration", "last_15m")
          lambda_unreserved_concurrent_executions_operator               = lookup(attr_val, "lambda_unreserved_concurrent_executions_operator", ">") 
          lambda_unreserved_concurrent_executions_maximum_critical       = lookup(attr_val, "lambda_unreserved_concurrent_executions_maximum_critical", 100)
          lambda_unreserved_concurrent_executions_maximum_timeframe      = lookup(attr_val, "lambda_unreserved_concurrent_executions_maximum_duration", "last_15m")
          lambda_unreserved_concurrent_executions_maximum_operator       = lookup(attr_val, "lambda_unreserved_concurrent_executions_maximum_operator", ">") 
        }))
      }
    ]
  ])
  catalog_lambda = { for item in local.catalog_lambda_list : item.key => item.value }

  custom_lambda_list = var.lambda_monitor.enabled == true && var.lambda_monitor.custom_monitors != null ? flatten([
    for key, val in var.lambda_monitor.custom_monitors : [
      for attr_key, attr_val in var.lambda_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_lambda = {
    for item in local.custom_lambda_list : item.id => jsondecode(templatefile(item.template, merge({
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
          lb_name                         = attr_val.lb_name
          lb_dns_name                     = attr_val.lb_dns_name
          notification_targets            = lookup(attr_val, "notification_targets", var.notification_targets)
          nlb_tcpelbreset_count_timeframe = lookup(attr_val, "nlb_tcpelbreset_count_timeframe", "last_5m")
          nlb_tcpelbreset_count_operator  = lookup(attr_val, "nlb_tcpelbreset_count_operator", ">")
          nlb_tcpelbreset_count_critical  = lookup(attr_val, "nlb_tcpelbreset_count_critical", 0)
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
  # rds
  catalog_rds_files         = [for filename in fileset("${path.module}/monitors/rds/", "*.json") : trimsuffix(filename, ".json")]
  catalog_rds_monitors_list = var.rds_monitor.enabled == true ? local.catalog_rds_files : []
  catalog_rds_list = flatten([
    for item in local.catalog_rds_monitors_list : [
      for attr_key, attr_val in var.rds_monitor.attributes : {
        key = "${attr_key}/rds/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/rds/${item}.json", {
          db_cluster_identifier                           = attr_val.db_cluster_identifier
          notification_targets                            = lookup(attr_val, "notification_targets", var.notification_targets)
          rds_cpu_utilization_timeframe                   = lookup(attr_val, "rds_cpu_utilization_timeframe", "last_5m")
          rds_cpu_utilization_operator                    = lookup(attr_val, "rds_cpu_utilization_operator", ">")
          rds_cpu_utilization_critical                    = lookup(attr_val, "rds_cpu_utilization_critical", 80)
          rds_burst_balance_timeframe                     = lookup(attr_val, "rds_burst_balance_timeframe", "last_5m")
          rds_burst_balance_operator                      = lookup(attr_val, "rds_burst_balance_operator", ">")
          rds_burst_balance_critical                      = lookup(attr_val, "rds_burst_balance_critical", 80)
          rds_transaction_logs_disk_usage_timeframe       = lookup(attr_val, "rds_transaction_logs_disk_usage_timeframe", "last_5m")
          rds_transaction_logs_disk_usage_operator        = lookup(attr_val, "rds_transaction_logs_disk_usage_operator", ">")
          rds_transaction_logs_disk_usage_critical        = lookup(attr_val, "rds_transaction_logs_disk_usage_critical", 80)
          rds_cpucredit_balance_timeframe                 = lookup(attr_val, "rds_cpucredit_balance_timeframe", "last_5m")
          rds_cpucredit_balance_operator                  = lookup(attr_val, "rds_cpucredit_balance_operator", ">")
          rds_cpucredit_balance_critical                  = lookup(attr_val, "rds_cpucredit_balance_critical", 80)
          rds_cpucredit_usage_timeframe                   = lookup(attr_val, "rds_cpucredit_usage_timeframe", "last_5m")
          rds_cpucredit_usage_operator                    = lookup(attr_val, "rds_cpucredit_usage_operator", ">")
          rds_cpucredit_usage_critical                    = lookup(attr_val, "rds_cpucredit_usage_critical", 80)
          rds_cpusurplus_credit_balance_timeframe         = lookup(attr_val, "rds_cpusurplus_credit_balance_timeframe", "last_5m")
          rds_cpusurplus_credit_balance_operator          = lookup(attr_val, "rds_cpusurplus_credit_balance_operator", ">")
          rds_cpusurplus_credit_balance_critical          = lookup(attr_val, "rds_cpusurplus_credit_balance_critical", 80)
          rds_cpusurplus_credits_charged_timeframe        = lookup(attr_val, "rds_cpusurplus_credits_charged_timeframe", "last_5m")
          rds_cpusurplus_credits_charged_operator         = lookup(attr_val, "rds_cpusurplus_credits_charged_operator", ">")
          rds_cpusurplus_credits_charged_critical         = lookup(attr_val, "rds_cpusurplus_credits_charged_critical", 80)
          rds_database_connections_timeframe              = lookup(attr_val, "rds_database_connections_timeframe", "last_5m")
          rds_database_connections_operator               = lookup(attr_val, "rds_database_connections_operator", ">")
          rds_database_connections_critical               = lookup(attr_val, "rds_database_connections_critical", 80)
          rds_dbload_timeframe                            = lookup(attr_val, "rds_dbload_timeframe", "last_5m")
          rds_dbload_operator                             = lookup(attr_val, "rds_dbload_operator", ">")
          rds_dbload_critical                             = lookup(attr_val, "rds_dbload_critical", 80)
          rds_dbload_cpu_timeframe                        = lookup(attr_val, "rds_dbload_cpu_timeframe", "last_5m")
          rds_dbload_cpu_operator                         = lookup(attr_val, "rds_dbload_cpu_operator", ">")
          rds_dbload_cpu_critical                         = lookup(attr_val, "rds_dbload_cpu_critical", 80)
          rds_dbload_non_cpu_timeframe                    = lookup(attr_val, "rds_dbload_non_cpu_timeframe", "last_5m")
          rds_dbload_non_cpu_operator                     = lookup(attr_val, "rds_dbload_non_cpu_operator", ">")
          rds_dbload_non_cpu_critical                     = lookup(attr_val, "rds_dbload_non_cpu_critical", 80)
          rds_disk_queue_depth_timeframe                  = lookup(attr_val, "rds_disk_queue_depth_timeframe", "last_5m")
          rds_disk_queue_depth_operator                   = lookup(attr_val, "rds_disk_queue_depth_operator", ">")
          rds_disk_queue_depth_critical                   = lookup(attr_val, "rds_disk_queue_depth_critical", 80)
          rds_failed_sqlserver_agent_jobs_count_timeframe = lookup(attr_val, "rds_failed_sqlserver_agent_jobs_count_timeframe", "last_5m")
          rds_failed_sqlserver_agent_jobs_count_operator  = lookup(attr_val, "rds_failed_sqlserver_agent_jobs_count_operator", ">")
          rds_failed_sqlserver_agent_jobs_count_critical  = lookup(attr_val, "rds_failed_sqlserver_agent_jobs_count_critical", 80)
          rds_free_storage_space_timeframe                = lookup(attr_val, "rds_free_storage_space_timeframe", "last_5m")
          rds_free_storage_space_operator                 = lookup(attr_val, "rds_free_storage_space_operator", ">")
          rds_free_storage_space_critical                 = lookup(attr_val, "rds_free_storage_space_critical", 80)
          rds_freeable_memory_timeframe                   = lookup(attr_val, "rds_freeable_memory_timeframe", "last_5m")
          rds_freeable_memory_operator                    = lookup(attr_val, "rds_freeable_memory_operator", ">")
          rds_freeable_memory_critical                    = lookup(attr_val, "rds_freeable_memory_critical", 80)
          rds_maximum_used_transaction_ids_timeframe      = lookup(attr_val, "rds_maximum_used_transaction_ids_timeframe", "last_5m")
          rds_maximum_used_transaction_ids_operator       = lookup(attr_val, "rds_maximum_used_transaction_ids_operator", ">")
          rds_maximum_used_transaction_ids_critical       = lookup(attr_val, "rds_maximum_used_transaction_ids_critical", 80)
          rds_network_receive_throughput_timeframe        = lookup(attr_val, "rds_network_receive_throughput_timeframe", "last_5m")
          rds_network_receive_throughput_operator         = lookup(attr_val, "rds_network_receive_throughput_operator", ">")
          rds_network_receive_throughput_critical         = lookup(attr_val, "rds_network_receive_throughput_critical", 80)
          rds_network_transmit_throughput_timeframe       = lookup(attr_val, "rds_network_transmit_throughput_timeframe", "last_5m")
          rds_network_transmit_throughput_operator        = lookup(attr_val, "rds_network_transmit_throughput_operator", ">")
          rds_network_transmit_throughput_critical        = lookup(attr_val, "rds_network_transmit_throughput_critical", 80)
          rds_oldest_replication_slot_lag_timeframe       = lookup(attr_val, "rds_oldest_replication_slot_lag_timeframe", "last_5m")
          rds_oldest_replication_slot_lag_operator        = lookup(attr_val, "rds_oldest_replication_slot_lag_operator", ">")
          rds_oldest_replication_slot_lag_critical        = lookup(attr_val, "rds_oldest_replication_slot_lag_critical", 80)
          rds_read_iops_timeframe                         = lookup(attr_val, "rds_read_iops_timeframe", "last_5m")
          rds_read_iops_operator                          = lookup(attr_val, "rds_read_iops_operator", ">")
          rds_read_iops_critical                          = lookup(attr_val, "rds_read_iops_critical", 80)
          rds_read_latency_timeframe                      = lookup(attr_val, "rds_read_latency_timeframe", "last_5m")
          rds_read_latency_operator                       = lookup(attr_val, "rds_read_latency_operator", ">")
          rds_read_latency_critical                       = lookup(attr_val, "rds_read_latency_critical", 80)
          rds_read_throughput_timeframe                   = lookup(attr_val, "rds_read_throughput_timeframe", "last_5m")
          rds_read_throughput_operator                    = lookup(attr_val, "rds_read_throughput_operator", ">")
          rds_read_throughput_critical                    = lookup(attr_val, "rds_read_throughput_critical", 80)
          rds_replica_lag_timeframe                       = lookup(attr_val, "rds_replica_lag_timeframe", "last_5m")
          rds_replica_lag_operator                        = lookup(attr_val, "rds_replica_lag_operator", ">")
          rds_replica_lag_critical                        = lookup(attr_val, "rds_replica_lag_critical", 80)
          rds_swap_usage_timeframe                        = lookup(attr_val, "rds_swap_usage_timeframe", "last_5m")
          rds_swap_usage_operator                         = lookup(attr_val, "rds_swap_usage_operator", ">")
          rds_swap_usage_critical                         = lookup(attr_val, "rds_swap_usage_critical", 80)
          rds_total_storage_space_timeframe               = lookup(attr_val, "rds_total_storage_space_timeframe", "last_5m")
          rds_total_storage_space_operator                = lookup(attr_val, "rds_total_storage_space_operator", ">")
          rds_total_storage_space_critical                = lookup(attr_val, "rds_total_storage_space_critical", 80)
          rds_transaction_logs_generation_timeframe       = lookup(attr_val, "rds_transaction_logs_generation_timeframe", "last_5m")
          rds_transaction_logs_generation_operator        = lookup(attr_val, "rds_transaction_logs_generation_operator", ">")
          rds_transaction_logs_generation_critical        = lookup(attr_val, "rds_transaction_logs_generation_critical", 80)
          rds_write_iops_timeframe                        = lookup(attr_val, "rds_write_iops_timeframe", "last_5m")
          rds_write_iops_operator                         = lookup(attr_val, "rds_write_iops_operator", ">")
          rds_write_iops_critical                         = lookup(attr_val, "rds_write_iops_critical", 80)
          rds_write_latency_timeframe                     = lookup(attr_val, "rds_write_latency_timeframe", "last_5m")
          rds_write_latency_operator                      = lookup(attr_val, "rds_write_latency_operator", ">")
          rds_write_latency_critical                      = lookup(attr_val, "rds_write_latency_critical", 80)
          rds_write_throughput_timeframe                  = lookup(attr_val, "rds_write_throughput_timeframe", "last_5m")
          rds_write_throughput_operator                   = lookup(attr_val, "rds_write_throughput_operator", ">")
          rds_write_throughput_critical                   = lookup(attr_val, "rds_write_throughput_critical", 80)
          rds_commit_latency_timeframe                    = lookup(attr_val, "rds_commit_latency_timeframe", "last_5m")
          rds_commit_latency_operator                     = lookup(attr_val, "rds_commit_latency_operator", ">")
          rds_commit_latency_critical                     = lookup(attr_val, "rds_commit_latency_critical", 80)
          rds_commit_throughput_timeframe                 = lookup(attr_val, "rds_commit_throughput_timeframe", "last_5m")
          rds_commit_throughput_operator                  = lookup(attr_val, "rds_commit_throughput_operator", ">")
          rds_commit_throughput_critical                  = lookup(attr_val, "rds_commit_throughput_critical", 80)
        }))
      }
    ]
  ])
  catalog_rds = { for item in local.catalog_rds_list : item.key => item.value }

  custom_rds_list = var.rds_monitor.enabled == true && var.rds_monitor.custom_monitors != null ? flatten([
    for key, val in var.rds_monitor.custom_monitors : [
      for attr_key, attr_val in var.rds_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_rds = {
    for item in local.custom_rds_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # spring
  catalog_spring_files         = [for filename in fileset("${path.module}/monitors/spring/", "*.json") : trimsuffix(filename, ".json")]
  catalog_spring_monitors_list = var.spring_monitor.enabled == true ? local.catalog_spring_files : []
  catalog_spring_list = flatten([
    for item in local.catalog_spring_monitors_list : [
      for attr_key, attr_val in var.spring_monitor.attributes : {
        key = "${attr_key}/spring/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/spring/${item}.json", {
          env                                    = attr_val.env
          runbook_url                            = lookup(attr_val, "runbook_url", "")
          service_name                           = attr_val.service_name
          notification_targets                   = lookup(attr_val, "notification_targets", var.notification_targets)
          p50_latency_timeframe                  = lookup(attr_val, "p50_latency_timeframe", "last_5m")
          p50_latency_operator                   = lookup(attr_val, "p50_latency_operator", ">")
          p50_critical_threshold                 = lookup(attr_val, "p50_critical_threshold", 0.8)
          p50_warning_threshold                  = lookup(attr_val, "p50_warning_threshold", 0.7)
          p90_latency_timeframe                  = lookup(attr_val, "p90_latency_timeframe", "last_5m")
          p90_latency_operator                   = lookup(attr_val, "p90_latency_operator", ">")
          p90_critical_threshold                 = lookup(attr_val, "p90_critical_threshold", 1)
          p90_warning_threshold                  = lookup(attr_val, "p90_warning_threshold", 0.9)
          error_rate_timeframe                   = lookup(attr_val, "error_rate_timeframe", "last_10m")
          error_rate_operator                    = lookup(attr_val, "error_rate_operator", ">")
          error_rate_warning_threshold           = lookup(attr_val, "error_rate_warning_threshold", 0.01)
          error_rate_critical_threshold          = lookup(attr_val, "error_rate_critical_threshold", 0.05)
          throughput_critical_recovery_threshold = lookup(attr_val, "throughput_critical_recovery_threshold", 0)
          throughput_critical_threshold          = lookup(attr_val, "throughput_critical_threshold", 1)
          throughput_timeframe                   = lookup(attr_val, "throughput_timeframe", "last_1h")
          throughput_alert_window                = lookup(attr_val, "throughput_alert_window", "last_5m")
          throughput_seasonality                 = lookup(attr_val, "throughput_seasonality", "monthly")
          throughput_recovery_window             = lookup(attr_val, "throughput_recovery_window", "last_5m")
          throughput_trigger_window              = lookup(attr_val, "throughput_trigger_window", "last_5m")
          throughput_operator                    = lookup(attr_val, "throughput_operator", ">=")
          throughput_deviations                  = lookup(attr_val, "throughput_deviations", 5)
        }))
      }
    ]
  ])
  catalog_spring = { for item in local.catalog_spring_list : item.key => item.value }

  custom_spring_list = var.spring_monitor.enabled == true && var.spring_monitor.custom_monitors != null ? flatten([
    for key, val in var.spring_monitor.custom_monitors : [
      for attr_key, attr_val in var.spring_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_spring = {
    for item in local.custom_spring_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # service
  catalog_service_files         = [for filename in fileset("${path.module}/monitors/service/", "*.json") : trimsuffix(filename, ".json")]
  catalog_service_monitors_list = var.service_monitor.enabled == true ? local.catalog_service_files : []
  catalog_service_list = flatten([
    for item in local.catalog_service_monitors_list : [
      for attr_key, attr_val in var.service_monitor.attributes : {
        key = "${attr_key}/service/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/service/${item}.json", {
          env                                  = attr_val.env
          latest_deployment_critical_threshold = lookup(attr_val, "latest_deployment_critical_threshold", 0)
          latest_deployment_timeframe          = lookup(attr_val, "latest_deployment_timeframe", "15m")
          latest_deployment_operator           = lookup(attr_val, "latest_deployment_operator", ">")
          log_warning_threshold                = lookup(attr_val, "log_warning_threshold", 1)
          log_critical_threshold               = lookup(attr_val, "log_critical_threshold", 5)
          log_timeframe                        = lookup(attr_val, "log_timeframe", "15m")
          log_operator                         = lookup(attr_val, "log_operator", ">")
          excessive_log_warning_threshold      = lookup(attr_val, "excessive_log_warning_threshold", 2000)
          excessive_log_critical_threshold     = lookup(attr_val, "excessive_log_critical_threshold", 3000)
          excessive_log_timeframe              = lookup(attr_val, "excessive_log_timeframe", "15m")
          excessive_log_operator               = lookup(attr_val, "excessive_log_operator", ">")
          faulty_deployment_critical_threshold = lookup(attr_val, "faulty_deployment_critical_threshold", 0)
          faulty_deployment_timeframe          = lookup(attr_val, "faulty_deployment_timeframe", "70m")
          faulty_deployment_operator           = lookup(attr_val, "faulty_deployment_operator", ">")
          runbook_url                          = lookup(attr_val, "runbook_url", "")
          service_name                         = attr_val.service_name
          notification_targets                 = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_service = { for item in local.catalog_service_list : item.key => item.value }

  custom_service_list = var.service_monitor.enabled == true && var.service_monitor.custom_monitors != null ? flatten([
    for key, val in var.service_monitor.custom_monitors : [
      for attr_key, attr_val in var.service_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_service = {
    for item in local.custom_service_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }

  #--------------------------------------------------------------------------------
  # apdex
  catalog_apdex_files         = [for filename in fileset("${path.module}/monitors/apdex/", "*.json") : trimsuffix(filename, ".json")]
  catalog_apdex_monitors_list = var.apdex_monitor.enabled == true ? local.catalog_apdex_files : []
  catalog_apdex_list = flatten([
    for item in local.catalog_apdex_monitors_list : [
      for attr_key, attr_val in var.apdex_monitor.attributes : {
        key = "${attr_key}/apdex/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/apdex/${item}.json", {
          env                                         = attr_val.env
          abnormal_change_in_apdex_warning_threshold  = lookup(attr_val, "abnormal_change_in_apdex_warning_threshold", 0.4)
          abnormal_change_in_apdex_critical_threshold = lookup(attr_val, "abnormal_change_in_apdex_critical_threshold", 0.6)
          service_name                                = attr_val.service_name
          abnormal_change_in_apdex_timeframe          = lookup(attr_val, "abnormal_change_in_apdex_timeframe", "last_10m")
          notification_targets                        = lookup(attr_val, "notification_targets", var.notification_targets)
        }))
      }
    ]
  ])
  catalog_apdex = { for item in local.catalog_apdex_list : item.key => item.value }

  custom_apdex_list = var.apdex_monitor.enabled == true && var.apdex_monitor.custom_monitors != null ? flatten([
    for key, val in var.apdex_monitor.custom_monitors : [
      for attr_key, attr_val in var.apdex_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_apdex = {
    for item in local.custom_apdex_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }



  #--------------------------------------------------------------------------------

  
  # transitgateway
  catalog_transitgateway_files         = [for filename in fileset("${path.module}/monitors/transitgateway/", "*.json") : trimsuffix(filename, ".json")]
  catalog_transitgateway_monitors_list = var.transitgateway_monitor.enabled == true ? local.catalog_transitgateway_files : []
  catalog_transitgateway_list = flatten([
    for item in local.catalog_transitgateway_monitors_list : [
      for attr_key, attr_val in var.transitgateway_monitor.attributes : {
        key = "${attr_key}/transitgateway/${item}"
        value = jsondecode(templatefile("${path.module}/monitors/transitgateway/${item}.json", {
          name                               = lookup(attr_val, "name", attr_val.api_id)
          api_id                             = attr_val.api_id
          notification_targets               = lookup(attr_val, "notification_targets", var.notification_targets)
          transitgateway_bytes_in     = lookup(attr_val, "transitgateway_bytes_in _timeframe", "last_5m")
          transitgateway_bytes_in      = lookup(attr_val, "transitgateway_bytes_in_operator", ">=")
          transitgateway_bytes_in      = lookup(attr_val, "transitgateway_bytes_in _critical", 1)
          transitgateway_bytes_out     = lookup(attr_val, "transitgateway_bytes_out", "last_5m")
          transitgateway_bytes_out     = lookup(attr_val, "transitgateway_bytes_out", ">=")
          transitgateway_bytes_out     = lookup(attr_val, "transitgateway_bytes_out", 1)
          transitgateway_packet_drop_count_blackhole    = lookup(attr_val, "transitgateway_packet_drop_count_blackhole_timeframe", "last_5m")
          transitgateway_packet_drop_count_blackhole    = lookup(attr_val, "transitgateway_packet_drop_count_blackhole_operator", ">=")
          transitgateway_packet_drop_count_blackhole    = lookup(attr_val, "transitgateway_packet_drop_count_blackhole_critical", 1)
          transitgateway_packet_drop_count_no_route     = lookup(attr_val, "transitgateway_packet_drop_count_no_route_timeframe", "last_5m")
          transitgateway_packet_drop_count_no_route     = lookup(attr_val, "transitgateway_packet_drop_count_no_route_operator", ">=")
          transitgateway_packet_drop_count_no_route     = lookup(attr_val, "transitgateway_packet_drop_count_no_route_critical", 1)
          transitgateway_packets_in      = lookup(attr_val, "transitgateway_packets_in_timeframe", "last_5m")
          transitgateway_packets_in      = lookup(attr_val, "transitgateway_packets_in_operator", ">=")
          transitgateway_packets_in      = lookup(attr_val, "transitgateway_packets_in_critical", 1)
          transitgateway_packets_out     = lookup(attr_val, "transitgateway_packets_out_timeframe", "last_5m")
          transitgateway_packets_out     = lookup(attr_val, "transitgateway_packets_out_operator", ">=")
          transitgateway_packets_out     = lookup(attr_val, "transitgateway_packets_out_critical", 1)

        }))
      }
    ]
  ])
  catalog_transitgateway = { for item in local.catalog_apigatewayv2_list : item.key => item.value }

  custom_transitgateway_list = var.transitgateway_monitor.enabled == true && var.transitgateway_monitor.custom_monitors != null ? flatten([
    for key, val in var.transitgateway_monitor.custom_monitors : [
      for attr_key, attr_val in var.transitgateway_monitor.attributes :
      {
        id         = "${attr_key}/${key}"
        template   = val
        attributes = attr_val
      }
    ]
  ]) : []
  custom_transitgateway = {
    for item in local.custom_transitgateway_list : item.id => jsondecode(templatefile(item.template, merge({
      notification_targets = lookup(item.attributes, "notification_targets", var.notification_targets)
    }, item.attributes)))
  }


  #--------------------------------------------------------------------------------

  monitors_map = merge(
    local.catalog_alb,
    local.custom_alb,

    local.catalog_apigateway,
    local.custom_apigateway,

    local.catalog_apigatewayv2,
    local.custom_apigatewayv2,

    local.catalog_docdb,
    local.custom_docdb,

    local.catalog_dynamodb,
    local.custom_dynamodb,

    local.catalog_ecs,
    local.custom_ecs,

    local.catalog_lambda,
    local.custom_lambda,

    local.catalog_nlb,
    local.custom_nlb,

    local.catalog_rds,
    local.custom_rds,

    local.catalog_spring,
    local.custom_spring,

    local.catalog_service,
    local.custom_service,

    local.catalog_apdex,
    local.custom_apdex
  )
  monitors = { for key, val in local.monitors_map : key => val if !contains(var.exclude_monitors, key) }
}
