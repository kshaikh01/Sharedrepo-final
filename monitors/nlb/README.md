## Inputs

### nlb_tcpelbreset_count monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| nlb_tcpelbreset_count_timeframe | Timeframe for the nlb_tcpelbreset_count monitor. | `string`| `"last_5m"` | no |
| nlb_tcpelbreset_count_operator | Operator for the nlb_tcpelbreset_count monitor [>, <, >=, <=,] | `string`| `">"` | no |
| nlb_tcpelbreset_count_critical | Critical threshold for the nlb_tcpelbreset_count monitor. | `0` | `number`| no |
