## Inputs

### cloudfront_4xxerror monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront_4xxerror_timeframe | Timeframe for the cloudfront_4xxerror monitor. | `string`| `"last_5m"` | no |
| cloudfront_4xxerror_operator | Operator for the cloudfront_4xxerror monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront_4xxerror_critical | Critical threshold for the cloudfront_4xxerror monitor. | `1` | `number`| no |
| cloudfront_4xxerror_critical_recovery | Critical Recovery threshold for the cloudfront_4xxerror monitor. | `0` | `number`| no |


### cloudfront_5xxerror monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront_5xxerror_timeframe | Timeframe for the cloudfront_5xxerror monitor. | `string`| `"last_5m"` | no |
| cloudfront_5xxerror_operator | Operator for the cloudfront_5xxerror monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront_5xxerror_critical | Critical threshold for the cloudfront_5xxerror monitor. | `1` | `number`| no |
| cloudfront_5xxerror_critical_recovery | Critical Recovery threshold for the cloudfront_5xxerror monitor. | `0` | `number`| no |
