## Inputs

### docdb_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpu_utilization_timeframe | Timeframe for the docdb_cpu_utilization monitor. | `string`| `"last_5m"` | no |
| docdb_cpu_utilization_operator | Operator for the docdb_cpu_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpu_utilization_critical | Critical threshold for the docdb_cpu_utilization monitor. | `80` | `number`| no |

### docdb_backup_retention_period monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdbb_backup_retention_period_timeframe | Timeframe for the docdb_backup_retention_period monitor. | `string`| `"last_5m"` | no |
| docdbb_backup_retention_period_operator | Operator for thedocdb_backup_retention_period monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdbb_backup_retention_period_critical | Critical threshold for the docdb_backup_retention_period monitor. | `80` | `number`| no |

### docdb_backup_retention_period_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdbb_backup_retention_period_maximum_timeframe | Timeframe for the docdbb_backup_retention_period_maximum monitor. | `string`| `"last_5m"` | no |
| docdbb_backup_retention_period_maximum_operator | Operator for the docdbb_backup_retention_period_maximum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdbb_backup_retention_period_maximum_critical | Critical threshold for the docdbb_backup_retention_period_maximum monitor. | `80` | `number`| no |

## docdb_backup_retention_period_minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdbb_backup_retention_period_minimum_timeframe | Timeframe for the docdbb_backup_retention_period_minimum monitor. | `string`| `"last_5m"` | no |
| docdbb_backup_retention_period_minimum_operator | Operator for the docdbb_backup_retention_period_minimum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdbb_backup_retention_period_minimum_critical | Critical threshold for the docdbb_backup_retention_period_minimum monitor. | `80` | `number`| no |

## docdb_backup_retention_period_sum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdbb_backup_retention_period_sum_timeframe | Timeframe for the docdbb_backup_retention_period_sum monitor. | `string`| `"last_5m"` | no |
| docdbb_backup_retention_period_sum_operator | Operator for the docdbb_backup_retention_period_sum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdbb_backup_retention_period_sum_critical | Critical threshold for the docdbb_backup_retention_period_sum monitor. | `80` | `number`| no |

## docdb_backup_storage_billed_samplecount monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_backup_storage_billed_samplecount_timeframe | Timeframe for the docdb_backup_storage_billed_samplecount monitor. | `string`| `"last_5m"` | no |
| docdb_backup_storage_billed_samplecount_operator | Operator for the docdb_backup_storage_billed_samplecount monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_backup_storage_billed_samplecount_critical | Critical threshold for the docdb_backup_storage_billed_samplecount monitor. | `80` | `number`| no |

## docdb_backup_retention_period_samplecount monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_backup_retention_period_samplecount_timeframe | Timeframe for the docdb_backup_retention_period_samplecount monitor. | `string`| `"last_5m"` | no |
| docdb_backup_retention_period_samplecount_operator | Operator for the docdb_backup_retention_period_samplecount monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_backup_retention_period_samplecount_critical | Critical threshold for the docdb_backup_retention_period_samplecount monitor. | `80` | `number`| no |

## docdb_cpucredit_usage monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_usage_timeframe | Timeframe for the docdb_cpucredit_usage monitor. | `string`| `"last_5m"` | no |
| ddocdb_cpucredit_usage_operator | Operator for the docdb_cpucredit_usage monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_usage_critical | Critical threshold for the docdb_cpucredit_usage monitor. | `80` | `number`| no |

## docdb_cpucredit_usage_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_usage_maximum_timeframe | Timeframe for the docdb_cpucredit_usage_maximum monitor. | `string`| `"last_5m"` | no |
| ddocdb_cpucredit_usage_maximum_operator | Operator for the docdb_cpucredit_usage_maximum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_usage_maximum_critical | Critical threshold for the docdb_cpucredit_usage_maximum monitor. | `80` | `number`| no |

## docdb_cpucredit_usage_minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_usage_minimum_timeframe | Timeframe for the docdb_cpucredit_usage_minimum monitor. | `string`| `"last_5m"` | no |
| ddocdb_cpucredit_usage_minimum_operator | Operator for the docdb_cpucredit_usage_minimum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_usage_minimum_critical | Critical threshold for the docdb_cpucredit_usage_minimum monitor. | `80` | `number`| no |

## docdb_cpucredit_usage_sum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_usage_sum_timeframe | Timeframe for the docdb_cpucredit_usage_sum monitor. | `string`| `"last_5m"` | no |
| ddocdb_cpucredit_usage_sum_operator | Operator for the docdb_cpucredit_usage_sum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_usage_sum_critical | Critical threshold for the docdb_cpucredit_usage_sum monitor. | `80` | `number`| no |

## docdb_cpucredit_usage_samplecount monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_usage_samplecount_timeframe | Timeframe for the docdb_cpucredit_usage_samplecount_sum monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_usage_samplecount_operator | Operator for the docdb_cpucredit_usage_samplecount_sum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_usage_samplecount_critical | Critical threshold for the docdb_cpucredit_usage_samplecount_sum monitor. | `80` | `number`| no |

## docdb_cpucredit_balance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_balance_timeframe | Timeframe for the docdb_cpucredit_balance monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_balance_operator | Operator for the docdb_cpucredit_balance monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_balance_critical | Critical threshold for the docdb_cpucredit_balance monitor. | `80` | `number`| no |

## docdb_cpucredit_balance_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_balance_maximum_timeframe | Timeframe for the docdb_cpucredit_balance_maximum monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_balance_maximum_operator | Operator for the docdb_cpucredit_balance_maximum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_balance_maximum_critical | Critical threshold for the docdb_cpucredit_balance_maximum monitor. | `80` | `number`| no |

## docdb_cpucredit_balance_minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_balance_minimum_timeframe | Timeframe for the docdb_cpucredit_balance_minimum monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_balance_minimum_operator | Operator for the docdb_cpucredit_balance_minimum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_balance_minimum_critical | Critical threshold for the docdb_cpucredit_balance_minimum monitor. | `80` | `number`| no |

## docdb_cpucredit_balance_sum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_balance_sum_timeframe | Timeframe for the docdb_cpucredit_balance_sum monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_balance_sum_operator | Operator for the docdb_cpucredit_balance_sum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_balance_sum_critical | Critical threshold for the docdb_cpucredit_balance_sum monitor. | `80` | `number`| no |

## docdb_cpucredit_balance_samplecount monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpucredit_balance_samplecount_timeframe | Timeframe for the docdb_cpucredit_balance_samplecount monitor. | `string`| `"last_5m"` | no |
| docdb_cpucredit_balance_samplecount_operator | Operator for the docdb_cpucredit_balance_samplecount monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpucredit_balance_samplecount_critical | Critical threshold for the docdb_cpucredit_balance_samplecount monitor. | `80` | `number`| no |

## docdb_cpusurplus_credit_balance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpusurplus_credit_balance_timeframe | Timeframe for the docdb_cpusurplus_credit_balance monitor. | `string`| `"last_5m"` | no |
| docdb_cpusurplus_credit_balance_operator | Operator for the docdb_cpusurplus_credit_balance monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpusurplus_credit_balance_critical | Critical threshold for the docdb_cpusurplus_credit_balance monitor. | `80` | `number`| no |

## docdb_cpusurplus_credit_balance_maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docdb_cpusurplus_credit_balance_maximum_timeframe | Timeframe for the docdb_cpusurplus_credit_balance_maximum monitor. | `string`| `"last_5m"` | no |
| docdb_cpusurplus_credit_balance_maximum_operator | Operator for the docdb_cpusurplus_credit_balance_maximum monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| docdb_cpusurplus_credit_balance_maximum_critical | Critical threshold for the docdb_cpusurplus_credit_balance_maximum monitor. | `80` | `number`| no |