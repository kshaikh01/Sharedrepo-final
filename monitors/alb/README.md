## Inputs

### alb_httpcode_elb_5xx monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb_httpcode_elb_5xx_timeframe | Timeframe for the alb_httpcode_elb_5xx monitor. | `string`| `"last_5m"` | no |
| alb_httpcode_elb_5xx_operator | Operator for the alb_httpcode_elb_5xx monitor [>, <, >=, <=,] | `string`| `">"` | no |
| alb_httpcode_elb_5xx_critical | Critical threshold for the alb_httpcode_elb_5xx monitor. | `0` | `number`| no |


### alb_connection_error monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb_connection_error_timeframe | Timeframe for the alb_connection_error monitor. | `string`| `"last_5m"` | no |
| alb_connection_error_operator | Operator for the alb_connection_error monitor [>, <, >=, <=,] | `string`| `">"` | no |
| alb_connection_error_critical | Critical threshold for the alb_connection_error monitor. | `0` | `number`| no |
