# Openhim-console

[Openhim Console](https://github.com/jembi/openhim-console).

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install openhim-console opensrp/openhim-console
```

## Introduction

This chart bootstraps  [openhim-console](https://github.com/jembi/openhim-console) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Openhim-console chart, and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"jembi/openhim-console"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"1.14"` |
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
| `ingress.hosts` |  | `[{"host": "openhim-console.local", "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls` |  | `[{"secretName": "chart-example-tls", "hosts": ["chart-example.local"]}]` |
| `resources` |  | `{}` |
| `autoscaling.enabled` |  | `false` |
| `autoscaling.minReplicas` |  | `1` |
| `autoscaling.maxReplicas` |  | `100` |
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |
| `nodeSelector` |  | `{}` |
| `tolerations` |  | `[]` |
| `affinity` |  | `{}` |
| `recreatePodsWhenConfigMapChange` |  | `true` |
| `extraInitContainers` |  | `null` |
| `extraVolumes` |  | `null` |
| `extraVolumeMounts` |  | `null` |
| `livenessProbe.initialDelaySeconds` |  | `30` |
| `livenessProbe.httpGet.path` |  | `"/"` |
| `livenessProbe.httpGet.port` |  | `"http"` |
| `readinessProbe.initialDelaySeconds` |  | `20` |
| `readinessProbe.httpGet.path` |  | `"/"` |
| `readinessProbe.httpGet.port` |  | `"http"` |
| `openhimCoreConfiguration.username` |  | `"root@openhim.org"` |
| `openhimCoreConfiguration.password` |  | `"openhim-password"` |
| `openhimCoreConfiguration.trustSelfSigned` |  | `"true"` |
| `openhimCoreConfiguration.host` |  | `""` |
| `openhimCoreConfiguration.port` |  | `"8080"` |
| `openhimCoreConfiguration.scheme` |  | `"https"` |
| `defaultJson` |  | [default.json](https://github.com/jembi/openhim-console/blob/master/app/config/default.json) |
| `commonLabels` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pda.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pda.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pda.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |

## Important!!
Kindly refer to this [documentation](../openhim-core/README.md#known-deployment-issue) to get up to speed with openHIM deployment.

### TL;DR
Update the following:
```yaml
openhimCoreConfiguration:
  trustSelfSigned: "true"
  host: "<openhIM core domain>"
  port: "443"
  scheme: "https"
```
