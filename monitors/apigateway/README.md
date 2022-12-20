## Inputs

### apigateway_4xxerror monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway_4xxerror_timeframe | Timeframe for the apigateway_4xxerror monitor. | `string`| `"last_5m"` | no |
| apigateway_4xxerror_operator | Operator for the apigateway_4xxerror monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway_4xxerror_critical | Critical threshold for the apigateway_4xxerror monitor. | `1` | `number`| no |
| apigateway_4xxerror_critical_recovery | Critical Recovery threshold for the apigateway_4xxerror monitor. | `0` | `number`| no |



### apigateway_5xxerror monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway_5xxerror_timeframe | Timeframe for the apigateway_5xxerror monitor. | `string`| `"last_5m"` | no |
| apigateway_5xxerror_operator | Operator for the apigateway_5xxerror monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway_5xxerror_critical | Critical threshold for the apigateway_5xxerror monitor. | `1` | `number`| no |
| apigateway_5xxerror_critical_recovery | Critical Recovery threshold for the apigateway_5xxerror monitor. | `0` | `number`| no |
