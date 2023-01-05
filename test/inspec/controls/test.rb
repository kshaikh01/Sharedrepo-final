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
    monitors["#{id}/apigateway/4xxerror"]["name"] => "apigateway.4xxerror: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigateway/5xxerror"]["name"] => "apigateway.5xxerror: #{mock_resource_ids["#{id}_apigateway"]}",
    monitors["#{id}/apigatewayv2/4xx"]["name"] => "apigatewayv2.4xx: #{mock_resource_ids["#{id}_apigatewayv2"]}",
    monitors["#{id}/apigatewayv2/5xx"]["name"] => "apigatewayv2.5xx: #{mock_resource_ids["#{id}_apigatewayv2"]}",
    monitors["#{id}/docdb/cpuutilization"]["name"] => "docdb.cpuutilization: #{mock_resource_ids["#{id}_docdb"]}",
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
    monitors["#{id}/lambda/throttles"]["name"] => "lambda.throttles: #{mock_resource_ids["#{id}_lambda"]}",
    monitors["#{id}/rds/cpuutilization"]["name"] => "rds.cpuutilization: #{mock_resource_ids["#{id}_rds"]}",
    monitors["#{id}/service/errors_in_latest_deployment"]["name"] => "service.errors_in_latest_deployment: #{mock_resource_ids["#{id}_service"]} #{env}",
    monitors["#{id}/service/errors_in_logs"]["name"] => "service.errors_in_logs: #{mock_resource_ids["#{id}_service"]} #{env}",
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
