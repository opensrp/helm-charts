

# Dhis2

[DHIS 2](https://github.com/dhis2/dhis2-core) is a flexible information system for data capture, management, validation, analytics and visualization.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install dhis2 opensrp/dhis2
```

## Introduction

This chart bootstraps  [dhis2](https://github.com/dhis2/dhis2-core) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Dhis2 chart and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"dhis2/core"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"2.35.3"` |
| `imagePullSecrets` |  | `[]` |
| `nameOverride` |  | `""` |
| `fullnameOverride` |  | `""` |
| `serviceAccount.create` |  | `true` |
| `serviceAccount.annotations` |  | `{}` |
| `serviceAccount.name` |  | `""` |
| `podAnnotations` |  | `{}` |
| `podSecurityContext` |  | `{}` |
| `securityContext` |  | `{}` |
| `service.type` |  | `"ClusterIP"` |
| `service.port` |  | `8080` |
| `ingress.enabled` |  | `false` |
| `ingress.className` |  | `""` |
| `ingress.annotations` |  | `{}` |
| `ingress.hosts` |  | `[{"host": "chart-example.local", "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls` |  | `[]` |
| `resources` |  | `{}` |
| `autoscaling.enabled` |  | `false` |
| `autoscaling.minReplicas` |  | `1` |
| `autoscaling.maxReplicas` |  | `100` |
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |
| `nodeSelector` |  | `{}` |
| `tolerations` |  | `[]` |
| `affinity` |  | `{}` |
| `recreatePodsWhenConfigMapChange` |  | `true` |
| `livenessProbe.httpGet.path` |  | `"/"` |
| `livenessProbe.httpGet.port` |  | `"http"` |
| `livenessProbe.initialDelaySeconds` |  | `180` |
| `livenessProbe.failureThreshold` |  | `10` |
| `readinessProbe.httpGet.path` |  | `"/"` |
| `readinessProbe.httpGet.port` |  | `"http"` |
| `readinessProbe.initialDelaySeconds` |  | `120` |
| `readinessProbe.failureThreshold` |  | `10` |
| `postgres.port` |  | `5432` |
| `postgres.host` |  | `""` |
| `postgres.username` |  | `""` |
| `postgres.password` |  | `""` |
| `postgres.database` |  | `""` |
| `dhisConf` |  | `"connection.dialect = org.hibernate.dialect.PostgreSQLDialect\nconnection.driver_class = org.postgresql.Driver\n\n# \"db\" maps to service name defined in Docker Compose\n# \"dhis2\" maps to POSTGRES_DB defined in Docker Compose\nconnection.url = jdbc:postgresql://{{ .Values.postgres.host }}:{{ .Values.postgres.port }}/{{ .Values.postgres.database}}\n\n# maps to POSTGRES_USER environment variable in Docker Compose.\nconnection.username = {{ .Values.postgres.username }}\n\n# maps to POSTGRES_PASSWORD environment variable in Docker Compose.\nconnection.password =  {{ .Values.postgres.password }}\n"` |
| `commonLabels` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pdb.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pdb.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pdb.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |
| `initResources` |  | `{}` |
