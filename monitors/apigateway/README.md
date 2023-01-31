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



### apigateway_count monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway_count_timeframe | Timeframe for the apigateway_count monitor. | `string`| `"last_5m"` | no |
| apigateway_count_operator | Operator for the apigateway_count monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway_count_critical | Critical threshold for the apigateway_count monitor. | `1` | `number`| no |


### apigateway_latency_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway_latency_maximum  | Timeframe for the apigateway_latency_maximum  monitor. | `string`| `"last_5m"` | no |
| apigateway_latency_maximum  | Operator for the apigateway_latency_maximum monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway_latency_maximum  | Critical threshold for the apigateway_latency.maximum  monitor. | `1` | `number`| no |


### apigateway_latency_minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway_latency_minimum  | Timeframe for the apigateway_latency_minimum monitor. | `string`| `"last_5m"` | no |
| apigateway_latency_minimum  | Operator for the apigateway_latency_minimum monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway_latency_minimum | Critical threshold for the apigateway_latency.minimum monitor. | `1` | `number`| no |


### apigateway.integration_latency.p90 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency.p90_timeframe | Timeframe for the apigateway.integration_latency.p90 monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency.p90_operator | Operator for the apigateway.integration_latency.p90 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency.p90_critical | Critical threshold for the apigateway.integration_latency.p90 monitor. | `1` | `number`| no |


### apigateway.integration_latency.p95 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency.p95_timeframe | Timeframe for the apigateway.integration_latency.p95 monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency.p95_operator | Operator for the apigateway.integration_latency.p95 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency.p95_critical | Critical threshold for the apigateway.integration_latency.p95 monitor. | `1` | `number`| no |

### apigateway.integration_latency.p99 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency.p99_timeframe | Timeframe for the apigateway.integration_latency.p99 monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency.p99_operator | Operator for the apigateway.integration_latency.p99 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency.p99_critical | Critical threshold for the apigateway.integration_latency.p99 monitor. | `1` | `number`| no |


### apigateway.integration_latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency_timeframe | Timeframe for the apigateway.integration_latency monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency_operator | Operator for the apigateway.integration_latency monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency_critical | Critical threshold for the apigateway.integration_latency monitor. | `1` | `number`| no |


### apigateway.integration_latency.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency.maximum_timeframe | Timeframe for the apigateway.integration_latency.maximum monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency.maximum_operator | Operator for the apigateway.integration_latency.maximum monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency.maximum_critical | Critical threshold for the apigateway.integration_latency.maximum monitor. | `1` | `number`| no |

### apigateway.integration_latency.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.integration_latency.minimum_timeframe | Timeframe for the apigateway.integration_latency.minimum monitor. | `string`| `"last_5m"` | no |
| apigateway.integration_latency.minimum_operator | Operator for the apigateway.integration_latency.minimum monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.integration_latency.minimum_critical | Critical threshold for the apigateway.integration_latency.minimum monitor. | `1` | `number`| no |


## apigateway.latency.p50 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency.p50_timeframe | Timeframe for the apigateway.latency.p50 monitor. | `string`| `"last_5m"` | no |
| apigateway.latency.p50_operator | Operator for the apigateway.latency.p50 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency.p50_critical | Critical threshold for the apigateway.latency.p50 monitor. | `1` | `number`| no |

## apigateway.latency.p75 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency.p75_timeframe | Timeframe for the apigateway.latency.p75 monitor. | `string`| `"last_5m"` | no |
| apigateway.latency.p75_operator | Operator for the apigateway.latency.p75 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency.p75_critical | Critical threshold for the apigateway.latency.p75 monitor. | `1` | `number`| no |

## apigateway.latency.p90 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency.p90_timeframe | Timeframe for the apigateway.latency.p90 monitor. | `string`| `"last_5m"` | no |
| apigateway.latency.p90_operator | Operator for the apigateway.latency.p90 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency.p90_critical | Critical threshold for the apigateway.latency.p90 monitor. | `1` | `number`| no |

## apigateway.latency.p95 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency.p95_timeframe | Timeframe for the apigateway.latency.p95 monitor. | `string`| `"last_5m"` | no |
| apigateway.latency.p95_operator | Operator for the apigateway.latency.p95 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency.p95_critical | Critical threshold for the apigateway.latency.p95 monitor. | `1` | `number`| no |

## apigateway.latency.p99 monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency.p99_timeframe | Timeframe for the apigateway.latency.p99 monitor. | `string`| `"last_5m"` | no |
| apigateway.latency.p99_operator | Operator for the apigateway.latency.p99 monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency.p99_critical | Critical threshold for the apigateway.latency.p99 monitor. | `1` | `number`| no |


## apigateway.latency monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway.latency_timeframe | Timeframe for the apigateway.latency monitor. | `string`| `"last_5m"` | no |
| apigateway.latency_operator | Operator for the apigateway.latency monitor [>, <, >=, <=,] | `string`| `">="` | no |
| apigateway.latency_critical | Critical threshold for the apigateway.latency monitor. | `1` | `number`| no |