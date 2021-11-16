# Openhim-core

OpenHIM Core https://github.com/jembi/openhim-core-js.

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

## Known deployment issue
Kindly refer to this [documentation](https://smartregister.atlassian.net/wiki/spaces/Documentation/pages/2976153601/Instant+OpenHIE+Setup#OpenHIM) to get up to speed with openHIM deployment.  
### TL;DR
OpenHIM core comes with inbuilt self signed certificate which should be updated prior to use.
There are two ways to do this:
1. Use ingress
    ```yaml
    ingress:
      enabled: true
      annotations:
        kubernetes.io/ingress.class: nginx
        kubernetes.io/tls-acme: "true"
        cert-manager.io/cluster-issuer: "letsencrypt-staging"
        cert-manager.io/acme-challenge-type: http01
        nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    
      hosts:
        - host: <openHIM core domain>
          paths:
            - path: /
              pathType: ImplementationSpecific
        - host: <openHIM core router domain>
          port: 5001
          paths:
            - path: /
              pathType: ImplementationSpecific
    
    livenessProbe:
      httpGet:
        scheme: "HTTP"
    
    readinessProbe:
      httpGet:
        scheme: "HTTP"
    ```
    The second host block belongs to router api & http port.
    
    Below is a snippet of default.json config that should be updated. (**Note** the * is https by default now its http )
    ```text
    defaultJson: |
      {
        ...
        "api": {
          "enabled": true,
          "protocol": "http", *
          "port": 8080,
            ...
        },
        ...
    ```
2. Use LoadBalancer service type and assign a domain to the external ip given.  
    Assumptions here is that https route will be routed to `ip:port` of openHIM core.
    Below is a snippet of default.json config that should be updated. (**Note** the * is https by default now its http )
    ```text
    defaultJson: |
      {
        ...
        "api": {
          "enabled": true,
          "protocol": "http", *
          "port": 8080,
            ...
        },
        ...
    ```
