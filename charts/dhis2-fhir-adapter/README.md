# DHIS2 FHIR Adapter

[DHIS2 FHIR Adapter](https://github.com/opensrp/dhis2-fhir-adapter) imports FHIR Resources into DHIS2 Tracker by using FHIR Subscriptions.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install dhis2-fhir-adapter opensrp/dhis2-fhir-adapter
```

## Introduction

This chart bootstraps `DHIS2 FHIR Adapter` deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

*   Kubernetes 1.12+
*   Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the chart, and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"opensrp/dhis2-fhir-adapter"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `""` |
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
| `ingress.hosts` |  | `[{"host": "dhis2-fhir-adapter.local", "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls` |  | `[]` |
| `resources` |  | `{}` |
| `autoscaling.enabled` |  | `false` |
| `autoscaling.minReplicas` |  | `1` |
| `autoscaling.maxReplicas` |  | `100` |
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |
| `nodeSelector` |  | `{}` |
| `tolerations` |  | `[]` |
| `affinity` |  | `{}` |
| `commonLabels` |  | `{}` |
| `recreatePodsWhenConfigMapChange` |  | `true` |
| `vpa.enabled` |  | `true` |
| `vpa.updatePolicy.updateMode` |  | `"Off"` |
| `vpa.resourcePolicy` |  | `{}` |
| `extraVolumeMounts` |  | `null` |
| `extraVolumes` |  | `null` |
| `readinessProbe.initialDelaySeconds` |  | `120` |
| `readinessProbe.failureThreshold` |  | `30` |
| `readinessProbe.timeoutSeconds` |  | `5` |
| `readinessProbe.httpGet.path` |  | `"/actuator/health"` |
| `readinessProbe.httpGet.port` |  | `"http"` |
| `livenessProbe.initialDelaySeconds` |  | `120` |
| `livenessProbe.failureThreshold` |  | `60` |
| `livenessProbe.timeoutSeconds` |  | `10` |
| `livenessProbe.httpGet.path` |  | `"/actuator/info"` |
| `livenessProbe.httpGet.port` |  | `"http"` |
| `env` |  | `"- name: SPRING_PROFILES_ACTIVE\n  value: dev\n"` |
| `applicationConfig.server.port` |  | `8080` |
| `applicationConfig` |  | [application.yaml](https://github.com/opensrp/dhis2-fhir-adapter/blob/master/app/src/main/resources/default-application.yml)|
| `pdb.enabled` |  | `false` |
| `pdb.minAvailable` |  | `""` |
| `pdb.maxUnavailable` |  | `1` |


## Logging Configuration

At the moment logging configuration which specifies the log appenders (`CONSOLE` or `FILE`) to be used is `dev` spring profile. This can be seen [here](https://github.com/opensrp/dhis2-fhir-adapter/blob/master/app/src/main/resources/logback-spring.xml#L53-L63). From code overview `dev` profile is only used for this logging configuration, for that reason its added on the env like below:
```yaml
env: |
  - name: SPRING_PROFILES_ACTIVE
    value: dev
```
