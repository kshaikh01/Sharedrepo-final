## Inputs

### dynamodb monitor

### account_max_reads
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-----|:--------:|
|account_max_reads_critical|Critical threshold for the dynamodb_account_max_reads monitor| 'number' | 0| no |
|account_max_reads_operator|Operator for the dynamodb_account_max_reads monitor| 'string'  | "<" | no |


### account_max_table_level_reads
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|account_max_table_level_reads_critical|Critical threshold for the dynamodb_account_max_table_level_reads monitor| 'number' | 0| no |
|account_max_table_level_reads_operator|Operator for the dynamodb_account_max_table_level_reads monitor| 'string'  | "<" | no |


### account_max_writes
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|account_max_writes_critical|Critical threshold for the dynamodb_account_max_writes monitor| 'number' | 0| no |
|account_max_writes_operator|Operator for the dynamodb_account_max_writes monitor| 'string'  | "<" | no |


### account_provisioned_read_capacity_utilization
| Name | Description | Type     | Default | Required |
|------|-------------|----------|----|:--------:|
|account_provisioned_read_capacity_utilization_critical|Critical threshold for the dynamodb_account_provisioned_read_capacity_utilization monitor| 'number' | 0  | no |
|account_provisioned_read_capacity_utilization_operator|Operator for the dynamodb_account_provisioned_read_capacity_utilization monitor| 'string'  | ">" | no |


### account_provisioned_write_capacity_utilization
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|account_provisioned_write_capacity_utilization_critical|Critical threshold for the dynamodb_account_provisioned_write_capacity_utilization monitor| 'number' | 0| no |
|account_provisioned_write_capacity_utilization_operator|Operator for the dynamodb_account_provisioned_write_capacity_utilization monitor| 'string'  | ">" | no |


### conditional_check_failed_requests
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|conditional_check_failed_requests_critical|Critical threshold for the dynamodb_conditional_check_failed_requests monitor| 'number' | 0| no |
|conditional_check_failed_requests_operator|Operator for the dynamodb_conditional_check_failed_requests monitor| 'string'  | ">" | no |


### consumed_read_capacity_units
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|consumed_read_capacity_units_critical|Critical threshold for the dynamodb_consumed_read_capacity_units monitor| 'number' | 0| no |
|consumed_read_capacity_units_operator|Operator for the dynamodb_consumed_read_capacity_units monitor| 'string'  | "<" | no |


### consumed_write_capacity_units
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|consumed_write_capacity_units_critical|Critical threshold for the dynamodb_consumed_write_capacity_units monitor| 'number' | 0| no |
|consumed_write_capacity_units_operator|Operator for the dynamodb_consumed_write_capacity_units monitor| 'string'  | "<" | no |


### global_secondary_indexes_index_size_bytes
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|global_secondary_indexes_index_size_bytes_critical|Critical threshold for the dynamodb_global_secondary_indexes_index_size_bytes monitor| 'number' | 0| no |
|global_secondary_indexes_index_size_bytes_operator|Operator for the dynamodb_global_secondary_indexes_index_size_bytes monitor| 'string'  | "<" | no |


### indexes_item_count
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|global_secondary_indexes_item_count_critical|Critical threshold for the dynamodb_indexes_item_count monitor| 'number' | 0| no |
|global_secondary_indexes_item_count_operator|Operator for the dynamodb_indexes_item_count monitor| 'string'  | "<" | no |


### item_count
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|item_count_critical|Critical threshold for the dynamodb_item_count monitor| 'number' | 0| no |
|item_count_operator|Operator for the dynamodb_item_count monitor| 'string'  | "<" | no |


### max_provisioned_table_read_capacity_utilization
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|max_provisioned_table_read_capacity_utilization_critical|Critical threshold for the dynamodb_max_provisioned_table_read_capacity_utilization monitor| 'number' | 0| no |
|max_provisioned_table_read_capacity_utilization_operator|Operator for the dynamodb_max_provisioned_table_read_capacity_utilization monitor| 'string'  | "<" | no |


### max_provisioned_table_write_capacity_utilization
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|max_provisioned_table_write_capacity_utilization_critical|Critical threshold for the dynamodb_max_provisioned_table_write_capacity_utilization monitor| 'number' | 0| no |
|max_provisioned_table_write_capacity_utilization_operator|Operator for the dynamodb_max_provisioned_table_write_capacity_utilization monitor| 'string'  | "<" | no |


### online_index_percentage_progress
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|online_index_percentage_progress_critical|Critical threshold for the dynamodb_online_index_percentage_progress monitor| 'number' | 0| no |
|online_index_percentage_progress_operator|Operator for the dynamodb_online_index_percentage_progress monitor| 'string'  | "<" | no |


### online_index_throttle_events
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|online_index_throttle_events_critical|Critical threshold for the dynamodb_online_index_throttle_events monitor| 'number' | 0| no |
|online_index_throttle_events_operator|Operator for the dynamodb_online_index_throttle_events monitor| 'string'  | "<" | no |


### read_throttle_events
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|read_throttle_events_critical|Critical threshold for the dynamodb_read_throttle_events monitor| 'number' | 0| no |
|read_throttle_events_operator|Operator for the dynamodb_read_throttle_events monitor| 'string'  | ">" | no |


### returned_item_count_maximum
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|returned_item_count_maximum_critical|Critical threshold for the dynamodb_returned_item_count_maximum monitor| 'number' | 0| no |
|returned_item_count_maximum_operator|Operator for the dynamodb_returned_item_count_maximum monitor| 'string'  | "<" | no |


### successful_request_latency
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|successful_request_latency_critical|Critical threshold for the dynamodb_successful_request_latency monitor| 'number' | 0| no |
|successful_request_latency_operator|Operator for the dynamodb_successful_request_latency monitor| 'string'  | "<" | no |


### system_errors
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|system_errors_critical|Critical threshold for the dynamodb_system_errors monitor| 'number' | 0| no |
|system_errors_operator|Operator for the dynamodb_system_errors monitor| 'string'  | "<" | no |


### table_size
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|table_size_critical|Critical threshold for the dynamodb_table_size monitor| 'number' | 0| no |
|table_size_operator|Operator for the dynamodb_account_table_size monitor| 'string'  | "<" | no |


### throttled_requests
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|throttled_requests_critical|Critical threshold for the dynamodb_throttled_requests monitor| 'number' | 0| no |
|throttled_requests_operator|Operator for the dynamodb_throttled_requests monitor| 'string'  | "<" | no |


### time_to_live_deleted_item_count
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|time_to_live_deleted_item_count_critical|Critical threshold for the dynamodb_time_to_live_deleted_item_count monitor| 'number' | 0| no |
|time_to_live_deleted_item_count_operator|Operator for the dynamodb_time_to_live_deleted_item_count monitor| 'string'  | "<" | no |


### user_errors
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|user_errors_critical|Critical threshold for the dynamodb_user_errors monitor| 'number' | 0| no |
|user_errors_operator|Operator for the dynamodb_account_user_errors monitor| 'string'  | ">" | no |


### write_throttle_events
| Name | Description | Type     | Default | Required |
|------|-------------|----------|-------|:--------:|
|write_throttle_events_critical|Critical threshold for the dynamodb_write_throttle_events monitor| 'number' | 0| no |
|write_throttle_events_operator|Operator for the dynamodb_write_throttle_events monitor| 'string'  | ">" | no |
