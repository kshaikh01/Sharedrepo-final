## Inputs

### lambda_throttles monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda_throttles_timeframe | Timeframe for the lambda_throttles monitor. | `string`| `"last_15m"` | no |
| lambda_throttles_operator | Operator for the lambda_throttles monitor [>, <, >=, <=,] | `string`| `">"` | no |
| lambda_throttles_critical | Critical threshold for the lambda_throttles monitor. | `100` | `number`| no |
