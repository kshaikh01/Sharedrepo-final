## Inputs

### ecs_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_cpu_utilization_timeframe | Timeframe for the ecs_cpu_utilization monitor. | `string`| `"last_15m"` | no |
| ecs_cpu_utilization_operator | Operator for the ecs_cpu_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| ecs_cpu_utilization_critical_threshold | Critical threshold for the ecs_cpu_utilization monitor. | `80` | `number`| no |


### ecs_memory_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_memory_utilization_timeframe | Timeframe for the ecs_memory_utilization monitor. | `string`| `"last_15m"` | no |
| ecs_memory_utilization_operator | Operator for the ecs_memory_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| ecs_memory_utilization_critical_threshold | Critical threshold for the ecs_memory_utilization monitor. | `80` | `number`| no |


### ecs_running_instance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_running_instance_timeframe | Timeframe for the ecs_running_instance monitor. | `string`| `"last_5m"` | no |
| ecs_running_instance_operator | Operator for the ecs_running_instance monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs_running_instance_critical | Critical threshold for the ecs_running_instance monitor. | `0` | `number`| no |
