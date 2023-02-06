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


## ecs.cpureservation.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpureservation.maximum_timeframe | Timeframe for the ecs.cpureservation.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cpureservation.maximum_operator | Operator for the ecs.cpureservation.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpureservation.maximum critical | Critical threshold for the ecs.cpureservation.maximum monitor. | `0` | `number`| no |

## ecs.cpureservation monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpureservation_timeframe | Timeframe for the ecs.cpureservation monitor. | `string`| `"last_5m"` | no |
| ecs.cpureservation_operator | Operator for the ecs.cpureservation monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpureservation critical | Critical threshold for the ecs.cpureservation monitor. | `0` | `number`| no |

## ecs.cpureservation.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpureservation.minimum_timeframe | Timeframe for the ecs.cpureservation.minimum monitor. | `string`| `"last_5m"` | no |
| ecs.cpureservation.minimum_operator | Operator for the ecs.cpureservation.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpureservation.minimum critical | Critical threshold for the ecs.cpureservation.minimum monitor. | `0` | `number`| no |

## ecs.cpuutilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpuutilization_timeframe | Timeframe for the ecs.cpuutilization monitor. | `string`| `"last_5m"` | no |
| ecs.cpuutilization_operator | Operator for the ecs.cpuutilization monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpuutilization critical | Critical threshold for the ecs.cpuutilization monitor. | `0` | `number`| no |


## ecs.cpuutilization.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpuutilization.maximum_timeframe | Timeframe for the ecs.cpuutilization.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.cpuutilization.maximum_operator | Operator for the ecs.cpuutilization.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpuutilization.maximum critical | Critical threshold for the ecs.cpuutilization.maximum monitor. | `0` | `number`| no |


## ecs.cpuutilization.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.cpuutilization.minimum_timeframe | Timeframe for the ecs.cpuutilization.mminimum monitor. | `string`| `"last_5m"` | no |
| ecs.cpuutilization.minimum_operator | Operator for the ecs.cpuutilization.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.cpuutilization.minimum_critical | Critical threshold for the ecs.cpuutilization.minimum monitor. | `0` | `number`| no |

## ecs.memory_reservation monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_reservation_timeframe | Timeframe for the ecs.memory_reservation monitor. | `string`| `"last_5m"` | no |
| ecs.memory_reservation_operator | Operator for the ecs.memory_reservation monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_reservation_critical | Critical threshold for the ecs.memory_reservation monitor. | `0` | `number`| no |

## ecs.memory_reservation.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_reservation.maximum_timeframe | Timeframe for the ecs.memory_reservation.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.memory_reservation.maximum_operator | Operator for the ecs.memory_reservation.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_reservation.maximum_critical | Critical threshold for the ecs.memory_reservation.maximum monitor. | `0` | `number`| no |

## ecs.memory_reservation.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_reservation.minimum_timeframe | Timeframe for the ecs.memory_reservation.minimum monitor. | `string`| `"last_5m"` | no |
| ecs.memory_reservation.minimum_operator | Operator for the ecs.memory_reservation.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_reservation.minimum_critical | Critical threshold for the ecs.memory_reservation.minimum monitor. | `0` | `number`| no |

## ecs.memory_utilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_utilizationtimeframe | Timeframe for the ecs.memory_utilization monitor. | `string`| `"last_5m"` | no |
| ecs.memory_utilization_operator | Operator for the ecs.memory_utilization monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_utilization_critical | Critical threshold for the ecs.memory_utilization monitor. | `0` | `number`| no |

## ecs.memory_utilization.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_utilization.maximum_timeframe | Timeframe for the ecs.memory_utilization.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.memory_utilization.maximum_operator | Operator for the ecs.memory_utilization.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_utilization.maximum_critical | Critical threshold for the ecs.memory_utilization.maximum monitor. | `0` | `number`| no |


## ecs.memory_utilization.minimum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.memory_utilization.minimum_timeframe | Timeframe for the ecs.memory_utilization.minimum monitor. | `string`| `"last_5m"` | no |
| ecs.memory_utilization.minimum_operator | Operator for the ecs.memory_utilization.minimum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.memory_utilization.minimum_critical | Critical threshold for the ecs.memory_utilization.minimum monitor. | `0` | `number`| no |

## ecs.pending_tasks_count monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.pending_tasks_count_timeframe | Timeframe for the ecs.pending_tasks_count monitor. | `string`| `"last_5m"` | no |
| ecs.pending_tasks_count_operator | Operator for the ecs.pending_tasks_count monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.pending_tasks_count_critical | Critical threshold for the ecs.pending_tasks_count monitor. | `0` | `number`| no |


## ecs.registered_cpu monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.registered_cpu_timeframe | Timeframe for the ecs.registered_cpu_count monitor. | `string`| `"last_5m"` | no |
| ecs.registered_cpu_operator | Operator for the ecs.registered_cpu monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.registered_cpu_critical | Critical threshold for the ecs.registered_cpu monitor. | `0` | `number`| no |


## ecs.registered_memory monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.registered_memory_timeframe | Timeframe for the ecs.registered_memory monitor. | `string`| `"last_5m"` | no |
| ecs.registered_memory_operator | Operator for the ecs.registered_memory monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.registered_memory_critical | Critical threshold for the ecs.registered_memory monitor. | `0` | `number`| no |


## ecs.pending_tasks_countmonitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.pending_tasks_count_timeframe | Timeframe for the ecs.pending_tasks_count monitor. | `string`| `"last_5m"` | no |
| ecs.pending_tasks_count_operator | Operator for the ecs.pending_tasks_count monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.pending_tasks_count_critical | Critical threshold for the ecs.pending_tasks_count monitor. | `0` | `number`| no |


## ecs.remaining_cpu monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.remaining_cpu_timeframe | Timeframe for the ecs.remaining_cpu monitor. | `string`| `"last_5m"` | no |
| ecs.remaining_cpu_operator | Operator for the ecs.remaining_cpu monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.remaining_cpu_critical | Critical threshold for the ecs.remaining_cpu monitor. | `0` | `number`| no |

## ecs.remaining_memory monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.remaining_memory_timeframe | Timeframe for the ecs.remaining_memory monitor. | `string`| `"last_5m"` | no |
| ecs.remaining_memory_operator | Operator for the ecs.remaining_memory monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.remaining_memory_critical | Critical threshold for the ecs.remaining_memory monitor. | `0` | `number`| no |


## ecs.running_tasks_count monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.running_tasks_count_timeframe | Timeframe for the ecs.running_tasks_count monitor. | `string`| `"last_5m"` | no |
| ecs.running_tasks_count_operator | Operator for the ecs.running_tasks_count monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.running_tasks_count_critical | Critical threshold for the ecs.running_tasks_countmonitor. | `0` | `number`| no |

## ecs.service.cpuutilization monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.service.cpuutilization_timeframe | Timeframe for the ecs.service.cpuutilization monitor. | `string`| `"last_5m"` | no |
| ecs.service.cpuutilization_operator | Operator for the ecs.service.cpuutilization monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.service.cpuutilization_critical | Critical threshold for the ecs.service.cpuutilization monitor. | `0` | `number`| no |


## ecs.service.cpuutilization.maximum monitor

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs.service.cpuutilization.maximum_timeframe | Timeframe for the ecs.service.cpuutilization.maximum monitor. | `string`| `"last_5m"` | no |
| ecs.service.cpuutilization.maximum_operator | Operator for the ecs.service.cpuutilization.maximum monitor [>, <, >=, <=, =] | `string`| `"<="` | no |
| ecs.service.cpuutilization.maximum_critical | Critical threshold for the ecs.service.cpuutilization.maximum monitor. | `0` | `number`| no |


