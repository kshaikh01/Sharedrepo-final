## Inputs

### lambda_throttles monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_throttles_timeframe | Timeframe for the lambda_throttles monitor. | `string`| `"last_15m"` | no |
| lambda_throttles_operator | Operator for the lambda_throttles monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_throttles_critical | Critical threshold for the lambda_throttles monitor. | `100` | `number`| no |

### lambda_duration monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_duration_timeframe | Timeframe for the lambda_duration monitor. | `string`| `"last_15m"` | no |
| lambda_duration_operator | Operator for the lambda_duration monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_duration_critical | Critical threshold for the lambda_duration monitor. | `100` | `number`| no |

### lambda_duration_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_duration_maximum_timeframe | Timeframe for the lambda_duration_maximum monitor. | `string`| `"last_15m"` | no |
| lambda_duration_maximum_operator | Operator for the lambda_duration_maximum monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_duration_maximum_critical | Critical threshold for the lambda_duration_maximum monitor. | `100` | `number`| no |

### lambda_enhanced_duration monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_enhanced_duration_timeframe | Timeframe for the lambda_enhanced_duration monitor. | `string`| `"last_15m"` | no |
| lambda_enhanced_duration_operator | Operator for the lambda_enhanced_duration monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_enhanced_duration_critical | Critical threshold for the lambda_enhanced_duration monitor. | `100` | `number`| no |

### lambda_enhanced_init_duration monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_enhanced_init_duration_timeframe | Timeframe for the lambda_enhanced_init_duration monitor. | `string`| `"last_15m"` | no |
| lambda_enhanced_init_duration_operator | Operator for the lambda_enhanced_init_duration monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_enhanced_init_duration_critical | Critical threshold for the lambda_enhanced_init_duration monitor. | `100` | `number`| no |

### lambda_enhanced_out_of_memory monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_enhanced_out_of_memory_timeframe | Timeframe for the lambda_enhanced_out_of_memory monitor. | `string`| `"last_15m"` | no |
| lambda_enhanced_out_of_memory_operator | Operator for the lambda_enhanced_out_of_memory monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_enhanced_out_of_memory_critical | Critical threshold for the lambda_enhanced_out_of_memory monitor. | `100` | `number`| no |

### lambda_errors monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_errors_timeframe | Timeframe for the  lambda_errors monitor. | `string`| `"last_15m"` | no |
|  lambda_errors_operator | Operator for the  lambda_errors monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_errors_critical | Critical threshold for the  lambda_errors monitor. | `100` | `number`| no |

### lambda_enhanced_estimated_cost monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_enhanced_estimated_cost_timeframe | Timeframe for the  lambda_enhanced_estimated_cost monitor. | `string`| `"last_15m"` | no |
|  lambda_enhanced_estimated_cost_operator | Operator for the  lambda_enhanced_estimated_cost monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_enhanced_estimated_cost_critical | Critical threshold for the  lambda_enhanced_estimated_cost monitor. | `100` | `number`| no |

### lambda_hits monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_hits_timeframe | Timeframe for the  lambda_hits monitor. | `string`| `"last_15m"` | no |
|  lambda_hits_operator | Operator for the  lambda_hits monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_hits_critical | Critical threshold for the  lambda_hits monitor. | `100` | `number`| no |

### lambda_duration_minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_duration_minimum_timeframe | Timeframe for the  lambda_duration_minimum monitor. | `string`| `"last_15m"` | no |
|  lambda_duration_minimum_operator | Operator for the  lambda_duration_minimum monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_duration_minimum_critical | Critical threshold for the  lambda_duration_minimum monitor. | `100` | `number`| no |

### lambda_duration_sum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_duration_sum_timeframe | Timeframe for the  lambda_duration_sum monitor. | `string`| `"last_15m"` | no |
|  lambda_duration_sum_operator | Operator for the  lambda_duration_sum monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_duration_sum_critical | Critical threshold for the  lambda_duration_sum monitor. | `100` | `number`| no |


### lambda_duration_p50 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_duration_p50_timeframe | Timeframe for the lambda_duration_p50 monitor. | `string`| `"last_15m"` | no |
|  lambda_duration_p50_operator | Operator for the  lambda_duration_p50 monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_duration_p50_critical | Critical threshold for the  lambda_duration_p50 monitor. | `100` | `number`| no |

### lambda_duration_p80 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_duration_p80_timeframe | Timeframe for the lambda_duration_p80 monitor. | `string`| `"last_15m"` | no |
|  lambda_duration_p80_operator | Operator for the  lambda_duration_p80 monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_duration_p80_critical | Critical threshold for the  lambda_duration_p80 monitor. | `100` | `number`| no |

### lambda_memorysize monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_memorysize_timeframe | Timeframe for the lambda_memorysize monitor. | `string`| `"last_15m"` | no |
|  lambda_memorysize_operator | Operator for the  lambda_memorysize monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_memorysize_critical | Critical threshold for the  lambda_memorysize monitor. | `100` | `number`| no |

### lambda_enhanced_max_memory_used monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_enhanced_max_memory_used_timeframe | Timeframe for the lambda_enhanced_max_memory_used monitor. | `string`| `"last_15m"` | no |
|  lambda_enhanced_max_memory_used_operator | Operator for the  lambda_enhanced_max_memory_used monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_enhanced_max_memory_used_critical | Critical threshold for the  lambda_enhanced_max_memory_used monitor. | `100` | `number`| no |

### lambda_invocations monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_invocations_timeframe | Timeframe for the lambda_invocations monitor. | `string`| `"last_15m"` | no |
|  lambda_invocations_operator | Operator for the  lambda_invocations monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_invocations_critical | Critical threshold for the  lambda_invocations monitor. | `100` | `number`| no |

### lambda_enhanced_invocations monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_enhanced_invocations_timeframe | Timeframe for the lambda_enhanced_invocations monitor. | `string`| `"last_15m"` | no |
|  lambda_enhanced_invocations_operator | Operator for the  lambda_enhanced_invocations monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_enhanced_invocations_critical | Critical threshold for the  lambda_enhanced_invocations monitor. | `100` | `number`| no |

### lambda_provisioned_concurrency_invocations monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_provisioned_concurrency_invocations_timeframe | Timeframe for the lambda_provisioned_concurrency_invocations monitor. | `string`| `"last_15m"` | no |
|  lambda_provisioned_concurrency_invocations_operator | Operator for the  lambda_provisioned_concurrency_invocations monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_provisioned_concurrency_invocations_critical | Critical threshold for the  lambda_provisioned_concurrency_invocations monitor. | `100` | `number`| no |

### lambda_provisioned_concurrency_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_provisioned_concurrency_utilization_timeframe | Timeframe for the lambda_provisioned_concurrency_utilization monitor. | `string`| `"last_15m"` | no |
|  lambda_provisioned_concurrency_utilization_operator | Operator for the  lambda_provisioned_concurrency_utilization monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_provisioned_concurrency_utilization_critical | Critical threshold for the  lambda_provisioned_concurrency_utilization monitor. | `100` | `number`| no |

### lambda_provisioned_concurrent_executions monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_provisioned_concurrent_executions_timeframe | Timeframe for the lambda_provisioned_concurrent_executions monitor. | `string`| `"last_15m"` | no |
|  lambda_provisioned_concurrent_executions_operator | Operator for the  lambda_provisioned_concurrent_executions monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_provisioned_concurrent_executions_critical | Critical threshold for the  lambda_provisioned_concurrent_executions monitor. | `100` | `number`| no |

### lambda_provisioned_concurrency_spillover_invocations monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_provisioned_concurrency_spillover_invocations_timeframe | Timeframe for the lambda_provisioned_concurrency_spillover_invocations monitor. | `string`| `"last_15m"` | no |
|  lambda_provisioned_concurrency_spillover_invocations_operator | Operator for the  lambda_provisioned_concurrency_spillover_invocations monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_provisioned_concurrency_spillover_invocations_critical | Critical threshold for the  lambda_provisioned_concurrency_spillover_invocations monitor. | `100` | `number`| no |

### lambda_enhanced_timeouts monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  lambda_enhanced_timeouts_timeframe | Timeframe for the lambda_enhanced_timeouts monitor. | `string`| `"last_15m"` | no |
|  lambda_enhanced_timeouts_operator | Operator for the  lambda_enhanced_timeouts monitor [>, <, >=, <=,] | `string`| `">"` | no |
|  lambda_enhanced_timeouts_critical | Critical threshold for the  lambda_enhanced_timeouts monitor. | `100` | `number`| no |