## Inputs

### apigatewayv2_4xx monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigatewayv2_4xx_timeframe | Timeframe for the apigatewayv2_4xx monitor. | `string`| `"last_5m"` | no |
| apigatewayv2_4xx_operator | Operator for the apigatewayv2_4xx monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigatewayv2_4xx_critical | Critical threshold for the apigatewayv2_4xx monitor. | `1` | `number`| no |
| apigatewayv2_4xx_critical_recovery | Critical Recovery threshold for the apigatewayv2_4xx monitor. | `0` | `number`| no |


### apigatewayv2_5xx monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigatewayv2_5xx_timeframe | Timeframe for the apigatewayv2_5xx monitor. | `string`| `"last_5m"` | no |
| apigatewayv2_5xx_operator | Operator for the apigatewayv2_5xx monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigatewayv2_5xx_critical | Critical threshold for the apigatewayv2_5xx monitor. | `1` | `number`| no |
| apigatewayv2_5xx_critical_recovery | Critical Recovery threshold for the apigatewayv2_5xx monitor. | `0` | `number`| no |
