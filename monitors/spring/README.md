## Inputs


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | Architecture environment | `string` | n/a | yes |
| service_name | Name of the service | `string` | n/a | yes |
| runbook_url | Link for the runbook | `string` | n/a | no |
| notification_targets | Notification Targets | `string` | n/a | yes |


### Throughput monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| throughput_critical_threshold | Critical threshold for the throughput monitor | `number` | `1` | no |
| throughput_critical_recovery_threshold | Critical recovery threshold for the throughput monitor | `number` | `0` | no |
| throughput_alert_window | Alert window for throughput query] | `string` | `"last_5m"` | no |
| throughput_recovery_window | Recovery window for throughput query] | `string` | `"last_5m"` | no |
| throughput_trigger_window | Trigger window for throughput query] | `string` | `"last_5m"` | no |
| throughput_timeframe | Timeframe for the throughput monitor | `string` | `"last_1h"` | no |
| throughput_seasonality | Seasonality for throughput query | `string` | `"monthly"` | no |
| throughput_operator | Operator for the throughput monitor [>, <, >=, <=,]| `string` | `">="` | no |
| throughput_deviations | A positive number; controls the sensitivity of the anomaly detection. [1-5]| `number` | `5` | no |


### P50 latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| p50_latency_operator | Operator for the p50 latency monitor [>, <, >=, <=,]| `string` | `">"` | no |
| p50_critical_threshold | Critical threshold for the p50 latency monitor | `number` | `0.8` | no |
| p50_warning_threshold | Warning threshold for the p50 latency monitor | `number` | `0.7` | no |
| p50_latency_timeframe | Timeframe for the p50 latency monitor | `string` | `"last_5m"` | no |


### P90 latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| p90_latency_operator | Operator for the p90 latency monitor [>, <, >=, <=,]| `string` | `">"` | no |
| p90_critical_threshold | Critical threshold for the p90 latency monitor | `number` | `1` | no |
| p90_warning_threshold | Warning threshold for the p90 latency monitor | `number` | `0.9` | no |
| p90_latency_timeframe | Timeframe for the p90 latency monitor | `string` | `"last_5m"` | no |


### Error rate monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| error_rate_operator | Operator for the error rate monitor [>, <, >=, <=,]| `string` | `">"` | no |
| error_rate_critical_threshold | Critical threshold for theerror rate monitor | `number` | `0.05` | no |
| error_rate_warning_threshold | Warning threshold for the error rate monitor | `number` | `0.01` | no |
| error_rate_timeframe | Timeframe for the error rate monitor | `string` | `"last_10m"` | no |