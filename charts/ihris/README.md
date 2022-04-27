# Ihris

iHRIS Software: Track, Manage, and Plan Your Health Workforce

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install ihris opensrp/ihris
```

## Introduction

This chart bootstraps [iHris](https://github.com/iHRIS/iHRIS) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Configuration

The following table lists the configurable parameters of the Ihris chart, and their default values.

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `replicaCount` |  | `1` |
| `image.repository` |  | `"ihris/ihris"` |
| `image.pullPolicy` |  | `"IfNotPresent"` |
| `image.tag` |  | `"03a377ab604bf6c6e0593c72b650f3f2b6da1935"` |
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
| `ingress.hosts` |  | `[{"host": "ihris.local", "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls` |  | `[]` |
| `resources` |  | `{}` |
| `autoscaling.enabled` |  | `false` |
| `autoscaling.minReplicas` |  | `1` |
| `autoscaling.maxReplicas` |  | `100` |
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |
| `nodeSelector` |  | `{}` |
| `tolerations` |  | `[]` |
| `affinity` |  | `{}` |
| `initContainerConfig.hapiFhirConfig.enable` |  | `false` |
| `initContainerConfig.hapiFhirConfig.image` |  | `"ihris/upload-definitions:a1cdd79"` |
| `initContainerConfig.hapiFhirConfig.command` |  | `"./hapi-fhir-cli upload-definitions -t {{ .Values.hapiFhirServerConfiguration.scheme }}://{{ .Values.hapiFhirServerConfiguration.host }}:{{ .Values.hapiFhirServerConfiguration.port }}/fhir -v {{ .Values.hapiFhirServerConfiguration.version }}"` |
| `initContainerConfig.ihirsConfig.enable` |  | `false` |
| `initContainerConfig.ihirsConfig.image` |  | `"ihris/ihris-config:8770136a592f7743e6478d2320550705f475304f"` |
| `initContainerConfig.ihirsConfig.command` |  | `"sushi /src/ig -s . && node load.js --server {{ .Values.hapiFhirServerConfiguration.scheme }}://{{ .Values.hapiFhirServerConfiguration.host }}:{{ .Values.hapiFhirServerConfiguration.port }}/fhir /src/ig/fsh-generated/resources/Basic*.json /src/ig/fsh-generated/resources/CodeSystem*.json /src/ig/fsh-generated/resources/Parameters*.json /src/ig/fsh-generated/resources/StructureDefinition*.json /src/ig/fsh-generated/resources/DocumentReference*.json /src/ig/fsh-generated/resources/Library*.json /src/ig/fsh-generated/resources/Person*.json /src/ig/fsh-generated/resources/ValueSet*.json /src/resources/Basic*.json /src/resources/CodeSystem*.json /src/resources/Library*.json /src/resources/Parameters*.json /src/resources/Person*.json /src/resources/ValueSet*.json /src/resources/SearchParameter*.json"` |
| `initContainerConfig.ihirsData.enable` |  | `false` |
| `initContainerConfig.ihirsData.image` |  | `"ihris/ihris-data:302967f"` |
| `hapiFhirServerConfiguration.host` |  | `""` |
| `hapiFhirServerConfiguration.scheme` |  | `"https"` |
| `hapiFhirServerConfiguration.port` |  | `8080` |
| `hapiFhirServerConfiguration.username` |  | `"hapi"` |
| `hapiFhirServerConfiguration.password` |  | `"hapi"` |
| `hapiFhirServerConfiguration.version` |  | `"r4"` |
| `esConfiguration.scheme` |  | `"http"` |
| `esConfiguration.host` | Elasticsearch-master | `""` |
| `esConfiguration.port` |  | `9200` |
| `redis.host` | Redis-master.<namespace>.svc.cluster.local | `""` |
| `kibana.host` | Kibana-kibana.<namespace>.svc.cluster.local | `""` |
| `kibana.scheme` |  | `"http"` |
| `kibana.port` |  | `5601` |
| `commonLabels` |  | `{}` |
| `vpa.enabled` | `Whether to enable vertical pod autoscaling` | `true` |
| `vpa.updatePolicy` | `The update policy to use with the vertical pod autoscaler` | `updateMode: "Off"` |
| `pda.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pda.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pda.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |
