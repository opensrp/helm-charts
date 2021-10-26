Hapi-fhir

[Hapi Fhir Server](https://github.com/hapifhir/hapi-fhir-jpaserver-starter) This project is a complete starter project you can use to deploy a FHIR server using HAPI FHIR JPA.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install hapi-fhir-server opensrp/hapi-fhir
```

## Introduction

This chart bootstraps  [hapi-fhir-jpaserver-starter](https://github.com/hapifhir/hapi-fhir-jpaserver-starter) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Hapi-fhir chart and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"hapiproject/hapi"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"v5.4.1"` |
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
| `postgres.port` |  | `5432` |
| `postgres.host` |  | `""` |
| `postgres.username` |  | `"fhir"` |
| `postgres.password` |  | `""` |
| `postgres.database` |  | `"fhir"` |
| `livenessProbe.httpGet.path` |  | `"/"` |
| `livenessProbe.httpGet.port` |  | `"http"` |
| `livenessProbe.initialDelaySeconds` |  | `120` |
| `livenessProbe.failureThreshold` |  | `5` |
| `readinessProbe.httpGet.path` |  | `"/"` |
| `readinessProbe.httpGet.port` |  | `"http"` |
| `readinessProbe.initialDelaySeconds` |  | `60` |
| `applicationConfig` |  | [application.yaml](https://github.com/hapifhir/hapi-fhir-jpaserver-starter/blob/master/src/main/resources/application.yaml)|
| `commonLabels` |  | `{}` |  
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
