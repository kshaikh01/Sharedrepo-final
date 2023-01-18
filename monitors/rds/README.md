## Inputs

### rds_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpu_utilization_timeframe | Timeframe for the rds_cpu_utilization monitor. | `string`| `"last_5m"` | no |
| rds_cpu_utilization_operator | Operator for the rds_cpu_utilization monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpu_utilization_critical | Critical threshold for the rds_cpu_utilization monitor. | `0` | `number`| no |

### rds_burst_balance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_burst_balance_timeframe | Timeframe for the rds_burst_balance monitor. | `string`| `"last_5m"` | no |
| rds_burst_balance_operator | Operator for the rds_burst_balance monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_burst_balance_critical | Critical threshold for the rds_burst_balance monitor. | `0` | `number`| no |

### rds_transaction_logs_disk_usage monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_transaction_logs_disk_usage_timeframe | Timeframe for the rds_transaction_logs_disk_usage monitor. | `string`| `"last_5m"` | no |
| rds_transaction_logs_disk_usage_operator | Operator for the rds_transaction_logs_disk_usage monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_transaction_logs_disk_usage_critical | Critical threshold for the rds_transaction_logs_disk_usage monitor. | `0` | `number`| no |

### rds_cpucredit_balance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpucredit_balance_timeframe | Timeframe for the rds_cpucredit_balance monitor. | `string`| `"last_5m"` | no |
| rds_cpucredit_balance_operator | Operator for the rds_cpucredit_balance monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpucredit_balance_critical | Critical threshold for the rds_cpucredit_balance monitor. | `0` | `number`| no |

### rds_cpucredit_usage monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpucredit_usage_timeframe | Timeframe for the rds_cpucredit_usage monitor. | `string`| `"last_5m"` | no |
| rds_cpucredit_usage_operator | Operator for the rds_cpucredit_usage monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpucredit_usage_critical | Critical threshold for the rds_cpucredit_usage monitor. | `0` | `number`| no |

### rds_cpusurplus_credit_balance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpusurplus_credit_balance_timeframe | Timeframe for the rds_cpusurplus_credit_balance monitor. | `string`| `"last_5m"` | no |
| rds_cpusurplus_credit_balance_operator | Operator for the rds_cpusurplus_credit_balance monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpusurplus_credit_balance_critical | Critical threshold for the rds_cpusurplus_credit_balance monitor. | `0` | `number`| no |

### rds_cpusurplus_credits_charged monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpusurplus_credits_charged_timeframe | Timeframe for the rds_cpusurplus_credits_charged monitor. | `string`| `"last_5m"` | no |
| rds_cpusurplus_credits_charged_operator | Operator for the rds_cpusurplus_credits_charged monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpusurplus_credits_charged_critical | Critical threshold for the rds_cpusurplus_credits_charged monitor. | `0` | `number`| no |

### rds_database_connections monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_database_connections_timeframe | Timeframe for the rds_database_connections monitor. | `string`| `"last_5m"` | no |
| rds_database_connections_operator | Operator for the rds_database_connections monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_database_connections_critical | Critical threshold for the rds_database_connections monitor. | `0` | `number`| no |

### rds_dbload monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_dbload_timeframe | Timeframe for the rds_dbload monitor. | `string`| `"last_5m"` | no |
| rds_dbload_operator | Operator for the rds_dbload monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_dbload_critical | Critical threshold for the rds_dbload monitor. | `0` | `number`| no |

### rds_dbload_cpu monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_dbload_cpu_timeframe | Timeframe for the rds_dbload_cpu monitor. | `string`| `"last_5m"` | no |
| rds_dbload_cpu_operator | Operator for the rds_dbload_cpu monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_dbload_cpu_critical | Critical threshold for the rds_dbload_cpu monitor. | `0` | `number`| no |

### rds_dbload_non_cpu monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_dbload_non_cpu_timeframe | Timeframe for the rds_dbload_non_cpu monitor. | `string`| `"last_5m"` | no |
| rds_dbload_non_cpu_operator | Operator for the rds_dbload_non_cpu monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_dbload_non_cpu_critical | Critical threshold for the rds_dbload_non_cpu monitor. | `0` | `number`| no |

### rds_disk_queue_depth monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_disk_queue_depth_timeframe | Timeframe for the rds_disk_queue_depth monitor. | `string`| `"last_5m"` | no |
| rds_disk_queue_depth_operator | Operator for the rds_disk_queue_depth monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_disk_queue_depth_critical | Critical threshold for the rds_disk_queue_depth monitor. | `0` | `number`| no |

### rds_failed_sqlserver_agent_jobs_count monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_failed_sqlserver_agent_jobs_count_timeframe | Timeframe for the rds_failed_sqlserver_agent_jobs_count monitor. | `string`| `"last_5m"` | no |
| rds_failed_sqlserver_agent_jobs_count_operator | Operator for the rds_failed_sqlserver_agent_jobs_count monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_failed_sqlserver_agent_jobs_count_critical | Critical threshold for the rds_failed_sqlserver_agent_jobs_count monitor. | `0` | `number`| no |

### rds_free_storage_space monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_free_storage_space_timeframe | Timeframe for the rds_free_storage_space monitor. | `string`| `"last_5m"` | no |
| rds_free_storage_space_operator | Operator for the rds_free_storage_space monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_free_storage_space_critical | Critical threshold for the rds_free_storage_space monitor. | `0` | `number`| no |

### rds_freeable_memory monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_freeable_memory_timeframe | Timeframe for the rds_freeable_memory monitor. | `string`| `"last_5m"` | no |
| rds_freeable_memory_operator | Operator for the rds_freeable_memory monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_freeable_memory_critical | Critical threshold for the rds_freeable_memory monitor. | `0` | `number`| no |

### rds_maximum_used_transaction_ids monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_maximum_used_transaction_ids_timeframe | Timeframe for the rds_maximum_used_transaction_ids monitor. | `string`| `"last_5m"` | no |
| rds_maximum_used_transaction_ids_operator | Operator for the rds_maximum_used_transaction_ids monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_maximum_used_transaction_ids_critical | Critical threshold for the rds_maximum_used_transaction_ids monitor. | `0` | `number`| no |

### rds_network_receive_throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_network_receive_throughput_timeframe | Timeframe for the rds_network_receive_throughput monitor. | `string`| `"last_5m"` | no |
| rds_network_receive_throughput_operator | Operator for the rds_network_receive_throughput monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_network_receive_throughput_critical | Critical threshold for the rds_network_receive_throughput monitor. | `0` | `number`| no |

### rds_network_transmit_throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_network_transmit_throughput_timeframe | Timeframe for the rds_network_transmit_throughput monitor. | `string`| `"last_5m"` | no |
| rds_network_transmit_throughput_operator | Operator for the rds_network_transmit_throughput monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_network_transmit_throughput_critical | Critical threshold for the rds_network_transmit_throughput monitor. | `0` | `number`| no |

### rds_oldest_replication_slot_lag monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_oldest_replication_slot_lag_timeframe | Timeframe for the rds_oldest_replication_slot_lag monitor. | `string`| `"last_5m"` | no |
| rds_oldest_replication_slot_lag_operator | Operator for the rds_oldest_replication_slot_lag monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_oldest_replication_slot_lag_critical | Critical threshold for the rds_oldest_replication_slot_lag monitor. | `0` | `number`| no |

### rds_read_iops monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_read_iops_timeframe | Timeframe for the rds_read_iops monitor. | `string`| `"last_5m"` | no |
| rds_read_iops_operator | Operator for the rds_read_iops monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_read_iops_critical | Critical threshold for the rds_read_iops monitor. | `0` | `number`| no |

### rds_read_latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_read_latency_timeframe | Timeframe for the rds_read_latency monitor. | `string`| `"last_5m"` | no |
| rds_read_latency_operator | Operator for the rds_read_latency monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_read_latency_critical | Critical threshold for the rds_read_latency monitor. | `0` | `number`| no |

### rds_read_throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_read_throughput_timeframe | Timeframe for the rds_read_throughput monitor. | `string`| `"last_5m"` | no |
| rds_read_throughput_operator | Operator for the rds_read_throughput monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_read_throughput_critical | Critical threshold for the rds_read_throughput monitor. | `0` | `number`| no |

### rds_replica_lag monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_replica_lag_timeframe | Timeframe for the rds_replica_lag monitor. | `string`| `"last_5m"` | no |
| rds_replica_lag_operator | Operator for the rds_replica_lag monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_replica_lag_critical | Critical threshold for the rds_replica_lag monitor. | `0` | `number`| no |

### rds_swap_usage monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_swap_usage_timeframe | Timeframe for the rds_swap_usage monitor. | `string`| `"last_5m"` | no |
| rds_swap_usage_operator | Operator for the rds_swap_usage monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_swap_usage_critical | Critical threshold for the rds_swap_usage monitor. | `0` | `number`| no |

### rds_total_storage_space monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_total_storage_space_timeframe | Timeframe for the rds_total_storage_space monitor. | `string`| `"last_5m"` | no |
| rds_total_storage_space_operator | Operator for the rds_total_storage_space monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_total_storage_space_critical | Critical threshold for the rds_total_storage_space monitor. | `0` | `number`| no |

### rds_transaction_logs_generation monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_transaction_logs_generation_timeframe | Timeframe for the rds_transaction_logs_generation monitor. | `string`| `"last_5m"` | no |
| rds_transaction_logs_generation_operator | Operator for the rds_transaction_logs_generation monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_transaction_logs_generation_critical | Critical threshold for the rds_transaction_logs_generation monitor. | `0` | `number`| no |

### rds_write_iops monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_write_iops_timeframe | Timeframe for the rds_write_iops monitor. | `string`| `"last_5m"` | no |
| rds_write_iops_operator | Operator for the rds_write_iops monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_write_iops_critical | Critical threshold for the rds_write_iops monitor. | `0` | `number`| no |

### rds_write_latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_write_latency_timeframe | Timeframe for the rds_write_latency monitor. | `string`| `"last_5m"` | no |
| rds_write_latency_operator | Operator for the rds_write_latency monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_write_latency_critical | Critical threshold for the rds_write_latency monitor. | `0` | `number`| no |

### rds_write_throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_write_throughput_timeframe | Timeframe for the rds_write_throughput monitor. | `string`| `"last_5m"` | no |
| rds_write_throughput_operator | Operator for the rds_write_throughput monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_write_throughput_critical | Critical threshold for the rds_write_throughput monitor. | `0` | `number`| no |

### rds_commit_latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_commit_latency_timeframe | Timeframe for the rds_commit_latency monitor. | `string`| `"last_5m"` | no |
| rds_commit_latency_operator | Operator for the rds_commit_latency monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_commit_latency_critical | Critical threshold for the rds_commit_latency monitor. | `0` | `number`| no |

### rds_commit_throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_commit_throughput_timeframe | Timeframe for the rds_commit_throughput monitor. | `string`| `"last_5m"` | no |
| rds_commit_throughput_operator | Operator for the rds_commit_throughput monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_commit_throughput_critical | Critical threshold for the rds_commit_throughput monitor. | `0` | `number`| no |