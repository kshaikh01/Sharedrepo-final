## Inputs

### dynamodb_read_throttle monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dynamodb_read_throttle_timeframe | Timeframe for the dynamodb_read_throttle monitor. | `string`| `"last_5m"` | no |
| dynamodb_read_throttle_operator | Operator for the dynamodb_read_throttle monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| dynamodb_read_throttle_critical | Critical threshold for the dynamodb_read_throttle monitor. | `0` | `number`| no |


### dynamodb_write_throttle monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dynamodb_write_throttle_timeframe | Timeframe for the dynamodb_write_throttle monitor. | `string`| `"last_5m"` | no |
| dynamodb_write_throttle_operator | Operator for the dynamodb_write_throttle monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| dynamodb_write_throttle_critical | Critical threshold for the dynamodb_write_throttle monitor. | `0` | `number`| no |


### dynamodb_system_errors monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dynamodb_system_errors_timeframe | Timeframe for the dynamodb_system_errors monitor. | `string`| `"last_5m"` | no |
| dynamodb_system_errors_operator | Operator for the dynamodb_system_errors monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| dynamodb_system_errors_critical | Critical threshold for the dynamodb_system_errors monitor. | `0` | `number`| no |


### dynamodb_user_errors monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dynamodb_user_errors_timeframe | Timeframe for the dynamodb_user_errors monitor. | `string`| `"last_5m"` | no |
| dynamodb_user_errors_operator | Operator for the dynamodb_user_errors monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| dynamodb_user_errors_critical | Critical threshold for the dynamodb_user_errors monitor. | `0` | `number`| no |

