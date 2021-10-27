# Openhim-core

Openhim Core https://github.com/jembi/openhim-core-js.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install openhim-core opensrp/openhim-core
```

## Introduction

This chart bootstraps [openhim-core](https://github.com/jembi/openhim-core-js) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0


## Configuration

The following table lists the configurable parameters of the Openhim-core chart and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"jembi/openhim-core"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"latest"` |
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
| `appPort` |  | `8080` |
| `httpApiPort` |  | `5001` |
| `httpsApiPort` |  | `5000` |
| `ingress.enabled` |  | `false` |
| `ingress.className` |  | `""` |
| `ingress.annotations` |  | `{}` |
| `ingress.hosts` |  | `[{"host": "openhim-core.local", "port": null, "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls` |  | `[]` |
| `resources` |  | `{}` |
| `autoscaling.enabled` |  | `false` |
| `autoscaling.minReplicas` |  | `1` |
| `autoscaling.maxReplicas` |  | `100` |
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |
| `nodeSelector` |  | `{}` |
| `tolerations` |  | `[]` |
| `affinity` |  | `{}` |
| `extraInitContainers` |  | `null` |
| `extraEnvs` |  | `null` |
| `extraVolumeMounts` |  | `null` |
| `extraVolumes` |  | `null` |
| `recreatePodsWhenConfigMapChange` |  | `true` |
| `mongodb.database` |  | `"openhim"` |
| `mongodb.username` |  | `"openhim"` |
| `mongodb.password` |  | `""` |
| `mongodb.host` |  | `"mongodb.<namespace>.svc.cluster.local"` |
| `livenessProbe.initialDelaySeconds` |  | `30` |
| `livenessProbe.timeoutSeconds` |  | `5` |
| `livenessProbe.httpGet.path` |  | `"/heartbeat"` |
| `livenessProbe.httpGet.port` |  | `"http"` |
| `livenessProbe.httpGet.scheme` |  | `"HTTPS"` |
| `readinessProbe.initialDelaySeconds` |  | `20` |
| `readinessProbe.timeoutSeconds` |  | `5` |
| `readinessProbe.httpGet.path` |  | `"/heartbeat"` |
| `readinessProbe.httpGet.port` |  | `"http"` |
| `readinessProbe.httpGet.scheme` |  | `"HTTPS"` |
| `defaultJson` |  | [default.json](https://github.com/jembi/openhim-core-js/blob/master/config/default.json)|
| `commonLabels` |  | `{}` |  
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
