# OpenCR

Open Client Registry helm chart for Kubernetes

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install opencr opensrp/opencr
```

## Introduction

This chart bootstraps [opencr](https://github.com/intrahealth/client-registry) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Opencr chart, and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"intrahealth/opencr"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"6195bd8"` |
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
| `service.port` |  | `3000` |
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
| `hapiFhirServerConfiguration.host` |  | `""` |
| `hapiFhirServerConfiguration.scheme` |  | `"https"` |
| `hapiFhirServerConfiguration.port` |  | `8080` |
| `hapiFhirServerConfiguration.username` |  | `"hapi"` |
| `hapiFhirServerConfiguration.password` |  | `"hapi"` |
| `esConfiguration.scheme` |  | `"http"` |
| `esConfiguration.host` |  | `""` |
| `esConfiguration.port` |  | `9200` |
| `commonLabels` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pdb.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pdb.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pdb.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |
