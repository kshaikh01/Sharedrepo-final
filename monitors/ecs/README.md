## Inputs

### ecs_cpu_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_cpu_utilization_timeframe | Timeframe for the ecs_cpu_utilization monitor. | `string`| `"last_15m"` | no |
| ecs_cpu_utilization_operator | Operator for the ecs_cpu_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| ecs_cpu_utilization_critical_threshold | Critical threshold for the ecs_cpu_utilization monitor. | `80` | `number`| no |


### ecs_memory_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_memory_utilization_timeframe | Timeframe for the ecs_memory_utilization monitor. | `string`| `"last_15m"` | no |
| ecs_memory_utilization_operator | Operator for the ecs_memory_utilization monitor [>, <, >=, <=, =] | `string`| `">"` | no |
| ecs_memory_utilization_critical_threshold | Critical threshold for the ecs_memory_utilization monitor. | `80` | `number`| no |


### ecs_running_instance monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_running_instance_timeframe | Timeframe for the ecs_running_instance monitor. | `string`| `"last_5m"` | no |
| ecs_running_instance_operator | Operator for the ecs_running_instance monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs_running_instance_critical | Critical threshold for the ecs_running_instance monitor. | `0` | `number`| no |

### ecs.cluster.cpureservation monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs_cluster_cpureservation_timeframe | Timeframe for the ecs.cluster.cpureservation monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpureservation_operator | Operator for the ecs.cluster.cpureservation monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpureservation_critical | Critical threshold for the ecs.cluster.cpureservation monitor. | `0` | `number`| no |

### ecs.cluster.cpureservation.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.cpureservation.maximum_timeframe | Timeframe for the ecs.cluster.cpureservation.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpureservation.maximum_operator | Operator for the ecs.cluster.cpureservation.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpureservation.maximum_critical | Critical threshold for the ecs.cluster.cpureservation.maximum monitor. | `0` | `number`| no |

### ecs.cluster.cpureservation.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.cpureservation.minimum_timeframe | Timeframe for the ecs.cluster.cpureservation.minimummonitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpureservation.minimum_operator | Operator for the ecs.cluster.cpureservation.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpureservation.minimum_critical | Critical threshold for the ecs.cluster.cpureservation.minimum monitor. | `0` | `number`| no |

### ecs.cluster.cpuutilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.cpuutilization_timeframe | Timeframe for the ecs.cluster.cpuutilization.minimummonitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpuutilization_operator | Operator for the ecs.cluster.cpuutilization monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpuutilization_critical | Critical threshold for the ecs.cluster.cpuutilization monitor. | `0` | `number`| no |


### ecs.cluster.cpuutilization.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.cpuutilization.maximum_timeframe | Timeframe for the ecs.cluster.cpuutilization.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpuutilization.maximum_operator | Operator for the ecs.cluster.cpuutilization.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpuutilization.maximum_critical | Critical threshold for the ecs.cluster.cpuutilization.maximum monitor. | `0` | `number`| no |

## ecs.cluster.cpuutilization.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.cpuutilization.minimum _timeframe | Timeframe for the ecs.cluster.cpuutilization.minimum  monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.cpuutilization.minimum _operator | Operator for the ecs.cluster.cpuutilization.minimum  monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.cpuutilization.minimum critical | Critical threshold for the ecs.cluster.cpuutilization.minimum monitor. | `0` | `number`| no |


## ecs.cluster.memory_reservation monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_reservation_timeframe | Timeframe for the ecs.cluster.memory_reservation monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_reservation_operator | Operator for the ecs.cluster.memory_reservation monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_reservation critical | Critical threshold for the ecs.cluster.memory_reservation  monitor. | `0` | `number`| no |

## ecs.cluster.memory_reservation.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_reservation.maximum_timeframe | Timeframe for the ecs.cluster.memory_reservation.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_reservation.maximum_operator | Operator for the ecs.cluster.memory_reservation.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_reservation.maximum critical | Critical threshold for the ecs.cluster.memory_reservation.maximum monitor. | `0` | `number`| no |


## ecs.cluster.memory_reservation.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_reservation.minimum_timeframe | Timeframe for the ecs.cluster.memory_reservation.minimum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_reservation.minimum_operator | Operator for the ecs.cluster.memory_reservation.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_reservation.minimum critical | Critical threshold for the ecs.cluster.memory_reservation.minimum monitor. | `0` | `number`| no |

## ecs.cluster.memory_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_utilization_timeframe | Timeframe for the ecs.cluster.memory_utilization monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_utilization_operator | Operator for the ecs.cluster.memory_utilization.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_utilization critical | Critical threshold for the ecs.cluster.memory_utilization monitor. | `0` | `number`| no |

## ecs.cluster.memory_utilization.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_utilization.maximum_timeframe | Timeframe for the ecs.cluster.memory_utilization.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_utilization.maximum_operator | Operator for the ecs.cluster.memory_utilization.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_utilization.maximum critical | Critical threshold for the ecs.cluster.memory_utilization.maximum monitor. | `0` | `number`| no |

## ecs.cluster.memory_utilization.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cluster.memory_utilization.minimum_timeframe | Timeframe for the ecs.cluster.memory_utilization.minimum monitor. | `string`| `"last_5m"` | no |
| ecs.cluster.memory_utilization.minimum_operator | Operator for the ecs.cluster.memory_utilization.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cluster.memory_utilization.minimum critical | Critical threshold for the ecs.cluster.memory_utilization.minimum monitor. | `0` | `number`| no |