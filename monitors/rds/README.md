## Inputs

### rds_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rds_cpu_utilization_timeframe | Timeframe for the rds_cpu_utilization monitor. | `string`| `"last_5m"` | no |
| rds_cpu_utilization_operator | Operator for the rds_cpu_utilization monitor [>, <, >=, <=,] | `string`| `">"` | no |
| rds_cpu_utilization_critical | Critical threshold for the rds_cpu_utilization monitor. | `0` | `number`| no |
