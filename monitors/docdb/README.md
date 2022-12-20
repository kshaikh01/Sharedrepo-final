## Inputs

### docdb_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpu_utilization_timeframe | Timeframe for the docdb_cpu_utilization monitor. | `string`| `"last_5m"` | no |
| docdb_cpu_utilization_operator | Operator for the docdb_cpu_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpu_utilization_critical | Critical threshold for the docdb_cpu_utilization monitor. | `80` | `number`| no |

