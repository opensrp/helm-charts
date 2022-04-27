# Openhim-mediator-mapping

The Mapping Mediator's function is to allow data validation, mapping, and orchestration between previously disparate systems.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install openhim-mediator-mapping opensrp/openhim-mediator-mapping
```

## Introduction

This chart bootstraps  [openhim-mediator-mapping](https://github.com/jembi/openhim-mediator-mapping) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Openhim-mediator-mapping chart and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"jembi/openhim-mediator-mapping"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"v1.0.0"` |
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
| `service.port` |  | `3003` |
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
| `openhimCoreConfiguration.username` |  | `"root@openhim.org"` |
| `openhimCoreConfiguration.password` |  | `"openhim-password"` |
| `openhimCoreConfiguration.trustSelfSigned` |  | `"true"` |
| `openhimCoreConfiguration.host` |  | `""` |
| `openhimCoreConfiguration.port` |  | `"8080"` |
| `openhimCoreConfiguration.scheme` |  | `"https"` |
| `mongodb.database` |  | `"openhim"` |
| `mongodb.username` |  | `"openhim"` |
| `mongodb.password` |  | `""` |
| `mongodb.host` |  | `"mongodb.<namespace>.svc.cluster.local"` |
| `commonLables` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pda.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pda.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pda.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |
