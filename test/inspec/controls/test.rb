# Read from output file
file_name = "output.json"
json_file = inspec.profile.file(file_name)
attributes = JSON.parse(json_file)

id = attributes['id']
mock_resource_ids = attributes['mock_resource_ids']
monitors = attributes['monitors']
empty_monitors = attributes['empty_monitors']
env = attributes['env']

comparisons = {
    monitors["#{id}/alb/httpcode_elb_5xx"]["name"] => "alb.HTTPCode_elb_5XX.override: #{mock_resource_ids["#{id}_alb"]}", # Test override
    monitors["#{id}/alb/target_connection_error_count"]["name"] => "alb.target_connection_error_count: #{mock_resource_ids["#{id}_alb"]}",
    monitors["#{id}/custom_alb"]["name"] => "alb.custom_target_connection_error_count: #{mock_resource_ids["#{id}_alb"]}", # Test additional custom monitor
    monitors["#{id}/nlb/tcpelbreset_count"]["name"] => "nlb.tcpelbreset_count: #{mock_resource_ids["#{id}_nlb"]}",
    monitors["#{id}/apdex/abnormal_change_in_apdex"]["name"] => "abnormal change in Apdex for Service #{mock_resource_ids["#{id}_apdex"]} #{env}",
    monitors["#{id}/apigateway/4xxerror"]["name"] => "apigateway.4xxerror: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/5xxerror"]["name"] => "apigateway.5xxerror: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.count"]["name"] => "apigateway.count: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency"]["name"] => "apigateway.integration_latency: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency.maximum"]["name"] => "apigateway.integration_latency.maximum: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency.minimum"]["name"] => "apigateway.integration_latency.minimum: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency.p90"]["name"] => "apigateway.integration_latency.p90: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency.p95"]["name"] => "apigateway.integration_latency.p95: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.integration_latency.p99"]["name"] => "apigateway.integration_latency.p99: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency"]["name"] => "apigateway.latency: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency_maximum"]["name"] => "apigateway.latency_maximum: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency_minimum"]["name"] => "apigateway.latency_minimum: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency.p50"]["name"] => "apigateway.latency.p50: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency.p75"]["name"] => "apigateway.latency.p75: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency.p90"]["name"] => "apigateway.latency.p90: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency.p95"]["name"] => "apigateway.latency.p95: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/apigateway.latency.p99"]["name"] => "apigateway.latency.p99: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/cloudfront/cloudfront.4xx"]["name"] => "cloudfront.4xx: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/cloudfront/cloudfront.5xx"]["name"] => "cloudfront.5xx: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/cloudfront/cloudfront.bytes_downloaded"]["name"] => "cloudfront.bytes_downloaded: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/cloudfront/cloudfront.bytes_uploaded"]["name"] => "cloudfront.bytes_uploaded: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/cloudfront/cloudfront.requests"]["name"] => "cloudfront.requests: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/cloudfront/cloudfront.total_error_rate"]["name"] => "cloudfront.total_error_rate: #{mock_resource_ids["#{id}_cloudfront"]}",
    monitors["#{id}/transitgateway/transitgateway.bytes_in"]["name"] => "transitgateway.bytes_in: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/transitgateway/transitgateway.bytes_out"]["name"] => "transitgateway.bytes_out: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/transitgateway/transitgateway.packet_drop_count_blackhole"]["name"] => "transitgateway.packet_drop_count_blackhole: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/transitgateway/transitgateway.packet_drop_count_no_route"]["name"] => "transitgateway.packet_drop_count_no_route: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/transitgateway/transitgateway.packets_in"]["name"] => "transitgateway.packets_in: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/transitgateway/transitgateway.packets_out"]["name"] => "transitgateway.packets_out: #{mock_resource_ids["#{id}_transitgateway"]}",
    monitors["#{id}/apigatewayv2/4xx"]["name"] => "apigatewayv2.4xx: #{mock_resource_ids["#{id}_apigatewayv2"]}",
    monitors["#{id}/apigatewayv2/5xx"]["name"] => "apigatewayv2.5xx: #{mock_resource_ids["#{id}_apigatewayv2"]}",
    monitors["#{id}/docdb/cpuutilization"]["name"] => "docdb.cpuutilization: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_retention_period"]["name"] => "docdb_backup_retention_period: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_retention_period_maximum"]["name"] => "docdb_backup_retention_period_maximum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_retention_period_minimum"]["name"] => "docdb_backup_retention_period_minimum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_retention_period_sum"]["name"] => "docdb_backup_retention_period_sum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_retention_period_samplecount"]["name"] => "docdb_backup_retention_period_samplecount: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_backup_storage_billed_samplecount"]["name"] => "docdb_backup_storage_billed_samplecount: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_usage"]["name"] => "docdb_cpucredit_usage: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_usage_maximum"]["name"] => "docdb_cpucredit_usage_maximum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_usage_minimum"]["name"] => "docdb_cpucredit_usage_minimum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_usage_samplecount"]["name"] => "docdb_cpucredit_usage_samplecount: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_balance"]["name"] => "docdb_cpucredit_balance: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_balance_maximum"]["name"] => "docdb_cpucredit_balance_maximum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_balance_minimum"]["name"] => "docdb_cpucredit_balance_minimum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_balance_sum"]["name"] => "docdb_cpucredit_balance_sum: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/docdb/docdb_cpucredit_balance_samplecount"]["name"] => "docdb_cpucredit_balance_samplecount: #{mock_resource_ids["#{id}_docdb"]}",
    monitors["#{id}/dynamodb/account_max_reads"]["name"] => "dynamodb.account_max_reads",
    monitors["#{id}/dynamodb/account_max_table_level_reads"]["name"] => "dynamodb.account_max_table_level_reads",
    monitors["#{id}/dynamodb/account_max_writes"]["name"] => "dynamodb.account_max_writes",
    monitors["#{id}/dynamodb/account_provisioned_read_capacity_utilization"]["name"] => "dynamodb.account_provisioned_read_capacity_utilization",
    monitors["#{id}/dynamodb/account_provisioned_write_capacity_utilization"]["name"] => "dynamodb.account_provisioned_write_capacity_utilization",
    monitors["#{id}/dynamodb/conditional_check_failed_requests"]["name"] => "dynamodb.conditional_check_failed_requests",
    monitors["#{id}/dynamodb/consumed_read_capacity_units"]["name"] => "dynamodb.consumed_read_capacity_units",
    monitors["#{id}/dynamodb/consumed_write_capacity_units"]["name"] => "dynamodb.consumed_write_capacity_units",
    monitors["#{id}/dynamodb/global_secondary_indexes.index_size_bytes"]["name"] => "dynamodb.global_secondary_indexes.index_size_bytes",
    monitors["#{id}/dynamodb/global_secondary_indexes.item_count"]["name"] => "dynamodb.global_secondary_indexes.item_count",
    monitors["#{id}/dynamodb/item_count"]["name"] => "dynamodb.item_count",
    monitors["#{id}/dynamodb/max_provisioned_table_read_capacity_utilization"]["name"] => "dynamodb.max_provisioned_table_read_capacity_utilization",
    monitors["#{id}/dynamodb/max_provisioned_table_write_capacity_utilization"]["name"] => "dynamodb.max_provisioned_table_write_capacity_utilization",
    monitors["#{id}/dynamodb/online_index_percentage_progress"]["name"] => "dynamodb.online_index_percentage_progress",
    monitors["#{id}/dynamodb/online_index_throttle_events"]["name"] => "dynamodb.online_index_throttle_events",
    monitors["#{id}/dynamodb/read_throttle_events"]["name"] => "dynamodb.read_throttle_events: #{mock_resource_ids["#{id}_dynamodb"]}",
    monitors["#{id}/dynamodb/returned_item_count.maximum"]["name"] => "dynamodb.returned_item_count.maximum",
    monitors["#{id}/dynamodb/successful_request_latency"]["name"] => "dynamodb.successful_request_latency",
    monitors["#{id}/dynamodb/system_errors"]["name"] => "dynamodb.system_errors: #{mock_resource_ids["#{id}_dynamodb"]}",
    monitors["#{id}/dynamodb/table_size"]["name"] => "dynamodb.table_size",
    monitors["#{id}/dynamodb/throttled_requests"]["name"] => "dynamodb.throttled_requests",
    monitors["#{id}/dynamodb/time_to_live_deleted_item_count"]["name"] => "dynamodb.time_to_live_deleted_item_count",
    monitors["#{id}/dynamodb/user_errors"]["name"] => "dynamodb.user_errors: #{mock_resource_ids["#{id}_dynamodb"]}",
    monitors["#{id}/dynamodb/write_throttle_events"]["name"] => "dynamodb.write_throttle_events: #{mock_resource_ids["#{id}_dynamodb"]}",
    monitors["#{id}/ecs/service.cpuutilization"]["name"] => "ecs.service.cpuutilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/service.memory_utilization"]["name"] => "ecs.service.memory_utilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/service.running_instance"]["name"] => "ecs.service.running_instance: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpureservation.maximum"]["name"] => "ecs.cluster.cpureservation.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpureservation.minimum"]["name"] => "ecs.cluster.cpureservation.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpureservation"]["name"] => "ecs.cluster.cpureservation: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpuutilization"]["name"] => "ecs.cluster.cpuutilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpuutilization.minimum"]["name"] => "ecs.cluster.cpuutilization.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.cpuutilization.maximum"]["name"] => "ecs.cluster.cpuutilization.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_reservation.maximum"]["name"] => "ecs.cluster.memory_reservation.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_reservation.minimum"]["name"] => "ecs.cluster.memory_reservation.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_reservation"]["name"] => "ecs.cluster.memory_reservation: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_utilization.maximum"]["name"] => "ecs.cluster.memory_utilization.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_utilization.minimum"]["name"] => "ecs.cluster.memory_utilization.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cluster.memory_utilization"]["name"] => "ecs.cluster.memory_utilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpureservation.maximum"]["name"] => "ecs.cpureservation.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpureservation"]["name"] => "ecs.cpureservation: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpureservation.minimum"]["name"] => "ecs.cpureservation.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpuutilization"]["name"] => "ecs.cpuutilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpuutilization.maximum"]["name"] => "ecs.cpuutilization.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.cpuutilization.minimum"]["name"] => "ecs.cpuutilization.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.memory_reservation.minimum"]["name"] => "ecs.memory_reservation.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.memory_utilization"]["name"] => "ecs.memory_utilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.memory_reservation.maximum"]["name"] => "ecs.memory_reservation.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.memory_utilization.minimum"]["name"] => "ecs.memory_utilization.minimum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.pending_tasks_count"]["name"] => "ecs.pending_tasks_count: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.registered_cpu"]["name"] => "ecs.registered_cpu: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.registered_memory"]["name"] => "ecs.registered_memory: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.remaining_cpu"]["name"] => "ecs.remaining_cpu: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.remaining_memory"]["name"] => "ecs.remaining_memory: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.running_tasks_count"]["name"] => "ecs.running_tasks_count: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.service.cpuutilization"]["name"] => "ecs.service.cpuutilization: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/ecs/ecs.service.cpuutilization.maximum"]["name"] => "ecs.service.cpuutilization.maximum: #{mock_resource_ids["#{id}_ecs"]}",
    monitors["#{id}/lambda/throttles"]["name"] => "lambda.throttles: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration"]["name"] => "lambda.duration: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration_maximum"]["name"] => "lambda.duration.maximum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_duration"]["name"] => "lambda.enhanced.duration: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_init_duration"]["name"] => "lambda.enhanced.init.duration: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_out_of_memory"]["name"] => "lambda.enhanced.out.of.memory: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_errors"]["name"] => "lambda.errors: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_estimated_cost"]["name"] => "lambda.enhanced.estimated.cost: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_hits"]["name"] => "lambda.hits: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration_minimum"]["name"] => "lambda.duration.minimum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration_sum"]["name"] => "lambda.duration.sum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration_p50"]["name"] => "lambda.duration.p50: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_duration_p80"]["name"] => "lambda.duration.p80: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_memorysize"]["name"] => "lambda_memorysize: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_max_memory_used"]["name"] => "lambda_enhanced_max_memory_used: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_invocations"]["name"] => "lambda_invocations: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_invocations"]["name"] => "lambda_enhanced_invocations: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_provisioned_concurrency_invocations"]["name"] => "lambda_provisioned_concurrency_invocations: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_provisioned_concurrency_utilization"]["name"] => "lambda_provisioned_concurrency_utilization: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_provisioned_concurrent_executions"]["name"] => "lambda_provisioned_concurrent_executions: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_provisioned_concurrency_spillover_invocations"]["name"] => "lambda_provisioned_concurrency_spillover_invocations: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_enhanced_timeouts"]["name"] => "lambda_enhanced_timeouts: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda_unreserved_concurrent_executions"]["name"] => "lambda.unreserved_concurrent_executions: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.unreserved_concurrent_executions"]["name"] => "lambda.unreserved_concurrent_executions: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions_global.maximum"]["name"] => "lambda.concurrent_executions_global.maximum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions_global.minimum"]["name"] => "lambda.concurrent_executions_global.minimum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions_global.sum"]["name"] => "lambda.concurrent_executions_global.sum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions_global"]["name"] => "lambda.concurrent_executions_global: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions.maximum"]["name"] => "lambda.concurrent_executions.maximum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions.minimum"]["name"] => "lambda.concurrent_executions.minimum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.concurrent_executions.sum"]["name"] => "lambda.concurrent_executions.sum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.duration.p95"]["name"] => "lambda.duration.p95: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.duration.p95"]["name"] => "lambda.duration.p95: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.duration.p99.9"]["name"] => "lambda.duration.p99.9: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.duration.p99"]["name"] => "lambda.duration.p99: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.enhanced.billed_duration]["name"] => "lambda.enhanced.billed_duration: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.provisioned_concurrency_utilization.maximum"]["name"] => "lambda.provisioned_concurrency_utilization.maximum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.provisioned_concurrency_utilization.minimum"]["name"] => "lambda.provisioned_concurrency_utilization.minimum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.unreserved_concurrent_executions.minimum"]["name"] => "lambda.unreserved_concurrent_executions.minimum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.throttles"]["name"] => "lambda.throttles: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.timeout"]["name"] => "lambda.timeout: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.unreserved_concurrent_executions"]["name"] => "lambda.unreserved_concurrent_executions: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/lambda/lambda.unreserved_concurrent_executions.maximum"]["name"] => "lambda.unreserved_concurrent_executions.maximum: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/rds/cpuutilization"]["name"] => "rds.cpuutilization: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_burst_balance"]["name"] => "rds_burst_balance: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_transaction_logs_disk_usage"]["name"] => "rds_transaction_logs_disk_usage: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_cpucredit_balance"]["name"] => "rds_cpucredit_balance: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_cpucredit_usage"]["name"] => "rds_cpucredit_usage: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_cpusurplus_credit_balance"]["name"] => "rds_cpusurplus_credit_balance: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_cpusurplus_credits_charged"]["name"] => "rds_cpusurplus_credits_charged: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_database_connections"]["name"] => "rds_database_connections: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_dbload"]["name"] => "rds_dbload: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_dbload_cpu"]["name"] => "rds_dbload_cpu: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_dbload_non_cpu"]["name"] => "rds_dbload_non_cpu: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_disk_queue_depth"]["name"] => "rds_disk_queue_depth: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_failed_sqlserver_agent_jobs_count"]["name"] => "rds_failed_sqlserver_agent_jobs_count: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_free_storage_space"]["name"] => "rds_free_storage_space: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_freeable_memory"]["name"] => "rds_freeable_memory: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_maximum_used_transaction_ids"]["name"] => "rds_maximum_used_transaction_ids: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_network_receive_throughput"]["name"] => "rds_network_receive_throughput: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_network_transmit_throughput"]["name"] => "rds_network_transmit_throughput: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_oldest_replication_slot_lag"]["name"] => "rds_oldest_replication_slot_lag: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_read_iops"]["name"] => "rds_read_iops: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_read_latency"]["name"] => "rds_read_latency: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_read_throughput"]["name"] => "rds_read_throughput: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_replica_lag"]["name"] => "rds_replica_lag: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_swap_usage"]["name"] => "rds_swap_usage: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_total_storage_space"]["name"] => "rds_total_storage_space: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_transaction_logs_generation"]["name"] => "rds_transaction_logs_generation: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_write_iops"]["name"] => "rds_write_iops: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_write_latency"]["name"] => "rds_write_latency: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_write_throughput"]["name"] => "rds_write_throughput: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_commit_latency"]["name"] => "rds_commit_latency: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/rds/rds_commit_throughput"]["name"] => "rds_commit_throughput: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/service/errors_in_latest_deployment"]["name"] => "service.errors_in_latest_deployment: #{mock_resource_ids["#{id}_service"]} #{env}",
    monitors["#{id}/service/errors_in_logs"]["name"] => "service.errors_in_logs: #{mock_resource_ids["#{id}_service"]} #{env}",
    monitors["#{id}/service/excessive_logs"]["name"] => "service.excessive_logs: #{mock_resource_ids["#{id}_service"]} #{env}",
    monitors["#{id}/service/faulty_deployment"]["name"] => "service.faulty_deployment: #{mock_resource_ids["#{id}_service"]} #{env}",
    monitors["#{id}/spring/abnormal_change_in_throughput"]["name"] => "spring.abnormal_change_in_throughput: #{mock_resource_ids["#{id}_spring"]} #{env}",
    monitors["#{id}/spring/high_error_rate"]["name"] => "spring.high_error_rate: #{mock_resource_ids["#{id}_spring"]} #{env}",
    monitors["#{id}/spring/service.p50latency"]["name"] => "spring.service.p50latency: #{mock_resource_ids["#{id}_spring"]} #{env}",
    monitors["#{id}/spring/service.p90latency"]["name"] => "spring.service.p90latency: #{mock_resource_ids["#{id}_spring"]} #{env}"
}

#--------------------------------------
control 'datadog_catalog' do
    impact 1.0
    title 'Test catalog outputs'

    describe empty_monitors.empty? do
        it { should cmp true }
    end

    comparisons.each do |key, val|
        describe key do
            it { should cmp val }
        end
    end
end  
