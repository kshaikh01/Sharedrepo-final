## transitgateway.bytes_in monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.bytes_in_timeframe | Timeframe for the transitgateway.bytes_in monitor. | `string`| `"last_5m"` | no |
| transitgateway.bytes_in_operator | Operator for the transitgateway.bytes_in monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.bytes_in_critical | Critical threshold for the transitgateway.bytes_in monitor. | `1` | `number`| no |


## transitgateway.bytes_out monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.bytes_out_timeframe | Timeframe for the transitgateway.bytes_out monitor. | `string`| `"last_5m"` | no |
| transitgateway.bytes_out_operator | Operator for the transitgateway.bytes_out monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.bytes_out_critical | Critical threshold for the transitgateway.bytes_out monitor. | `1` | `number`| no |


## transitgateway.packet_drop_count_blackhole monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.packet_drop_count_blackhole_timeframe | Timeframe for the transitgateway.packet_drop_count_blackhole monitor. | `string`| `"last_5m"` | no |
| transitgateway.packet_drop_count_blackhole_operator | Operator for the transitgateway.packet_drop_count_blackhole monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.packet_drop_count_blackhole_critical | Critical threshold for the transitgateway.packet_drop_count_blackhole monitor. | `1` | `number`| no |

## transitgateway.packet_drop_count_no_route monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.packet_drop_count_no_route_timeframe | Timeframe for the transitgateway.packet_drop_count_no_route monitor. | `string`| `"last_5m"` | no |
| transitgateway.packet_drop_count_no_route_operator | Operator for the transitgateway.packet_drop_count_no_route monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.packet_drop_count_no_route_critical | Critical threshold for the transitgateway.packet_drop_count_no_route monitor. | `1` | `number`| no |


## transitgateway.packets_in monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.packets_in_timeframe | Timeframe for the transitgateway.packets_in monitor. | `string`| `"last_5m"` | no |
| transitgateway.packets_in_operator | Operator for the transitgateway.packets_in monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.packets_in_critical | Critical threshold for the transitgateway.packets_in monitor. | `1` | `number`| no |

## transitgateway.packets_out monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| transitgateway.packets_out_timeframe | Timeframe for the transitgateway.packets_out monitor. | `string`| `"last_5m"` | no |
| transitgateway.packets_out_operator | Operator for the transitgateway.packets_out monitor [>, <, >=, <=,] | `string`| `">="` | no |
| transitgateway.packets_out_critical | Critical threshold for the transitgateway.packets_out monitor. | `1` | `number`| no |
