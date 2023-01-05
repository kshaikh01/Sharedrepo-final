## Inputs

### Error in latest deployment monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| latest_deployment_timeframe | Timeframe for the error in latest deployment monitor. | `string`| `"15m"` | no |
| latest_deployment_operator | Operator for the error in latest deployment monitor [>, <, >=, <=,=] | `string`| `">"` | no |
| latest_deployment_critical_threshold | Critical threshold for the error in latest deployment monitor. | `0` | `number`| no |


### Error in logs monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| log_timeframe | Timeframe for the error in logs monitor. | `string`| `"15m"` | no |
| log_operator | Operator for the error in logs monitor [>, <, >=, <=,=] | `string`| `">"` | no |
| log_critical_threshold | Critical threshold for the error in logs monitor. | `5` | `number`| no |
| log_warning_threshold | Warning threshold for the error in logs monitor. | `1` | `number`| no |


### excessive logs monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| excessive_log_timeframe | Timeframe for the excessive logs monitor. | `string`| `"15m"` | no |
| excessive_log_operator | Operator for the excessive logs monitor [>, <, >=, <=,=] | `string`| `">"` | no |
| excessive_log_critical_threshold | Critical threshold for the excessive logs monitor. | `3000` | `number`| no |
| excessive_log_warning_threshold | Warning threshold for the excessive logs monitor. | `2000` | `number`| no |



### Faulty deployment monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| faulty_deployment_timeframe | Timeframe for the faulty deployment monitor. | `string`| `"70m"` | no |
| faulty_deployment_operator | Operator for the faulty deployment monitor [>, <, >=, <=,=] | `string`| `">"` | no |
| faulty_deployment_critical_threshold | Critical threshold for the faulty deployment monitor. | `0` | `number`| no |


