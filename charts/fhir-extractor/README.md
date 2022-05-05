
# Fhir-extractor

A Helm chart for Kubernetes

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install fhir-extractor opensrp/fhir-extractor
```

## Introduction

This chart bootstraps jembi/fhir-extractor deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Fhir-extractor chart, and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"jembi/fhir-extractor"` |
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
| `hapiFhirServerConfiguration.host` |  | `""` |
| `hapiFhirServerConfiguration.scheme` |  | `"https"` |
| `hapiFhirServerConfiguration.port` |  | `8080` |
| `hapiFhirServerConfiguration.username` |  | `"hapi"` |
| `hapiFhirServerConfiguration.password` |  | `"hapi"` |
| `logstashConfiguration.scheme` |  | `"http"` |
| `logstashConfiguration.host` |  | `""` |
| `logstashConfiguration.port` |  | `9600` |
| `commonLabels` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pdb.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pdb.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pdb.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |
