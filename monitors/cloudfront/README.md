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

### cloudfront_bytes_downloaded monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront_bytes_downloaded_timeframe | Timeframe for the cloudfront.bytes_downloaded monitor. | `string`| `"last_5m"` | no |
| cloudfront_bytes_downloaded_operator | Operator for the cloudfront.bytes_downloaded monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront_bytes_downloaded_critical | Critical threshold for the cloudfront.bytes_downloaded monitor. | `1` | `number`| no |

### cloudfront_bytes_uploaded monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront_bytes_uploaded_timeframe | Timeframe for the cloudfront.bytes_uploaded monitor. | `string`| `"last_5m"` | no |
| cloudfront_bytes_uploaded_operator | Operator for the cloudfront.bytes_uploaded monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront_bytes_uploaded_critical | Critical threshold for the cloudfront.bytes_uploaded monitor. | `1` | `number`| no |

### cloudfront.requests monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront.requests_timeframe | Timeframe for the cloudfront.requests monitor. | `string`| `"last_5m"` | no |
| cloudfront.requests_operator | Operator for the cloudfront.requests monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront.requests_critical | Critical threshold for the cloudfront.requests monitor. | `1` | `number`| no |

### cloudfront.total_error_rate monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudfront.total_error_rate_timeframe | Timeframe for the cloudfront.total_error_rate monitor. | `string`| `"last_5m"` | no |
| cloudfront.total_error_rate_operator | Operator for the cloudfront.total_error_rate monitor [>, <, >=, <=,] | `string`| `">="` | no |
| cloudfront.total_error_rate_critical | Critical threshold for the cloudfront.total_error_rate monitor. | `1` | `number`| no |



