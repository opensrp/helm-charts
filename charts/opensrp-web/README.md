# Opensrp-web

OpenSRP Web is the default frontend for the OpenSRP Server API, providing access to the data collected on the server, configuration options as well as any functionality provided by the API server.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install opensrp-web opensrp/opensrp-web
```

## Introduction

This chart bootstraps [opensrp web](https://github.com/OpenSRP/web) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Installing the Chart

To install the chart with the release name `opensrp-web`:

## Prerequisites for installing Opensrp Web

An Opensrp Server Web Instance

Sample value.yaml

```yaml
---
image:
  tag: "v1.0.5"

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
    cert-manager.io/cluster-issuer: <YourClusterIssuer>
    cert-manager.io/acme-challenge-type: http01
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
    hosts:
      - host: opensrp-web.local
        paths:
          - path: /
            pathType: ImplementationSpecific

    tls:
      - secretName: opensrp-web-tls
        hosts:
          - opensrp-web.local

sharedVars:
  keycloakUrl: "keycloak-url"
  appDomainName: "<app-domain-name>"
  opensrpClientId: "<opensrp-client-id>"
  opensrpServer: "<opensrp-server>"
  keycloakRealm: "<keycloak-realm>"
  opensrpClientSecret: sample

express:
  opensrpClientId: "<opensrp-client-id>"
  opensrpClientSecret: sample
  sessionSecret: sample-secret

reactEnvironmentVariables:
  REACT_APP_ENABLE_LOCATIONS: "true"
  REACT_APP_ENABLE_TEAMS: "true"
  REACT_APP_WEBSITE_NAME: "<website-name>"
  REACT_APP_ENABLE_TEAMS_ASSIGNMENT_MODULE: "true"
```

## Common Parameters

| Parameter                                    | Description                                                           | Default                                                                                           |
| -------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `replicaCount`                               | `Number of pods`                                                      | `1`                                                                                               |
| `image.registry`                             | `Image regsitry`                                                      | `"docker.io"`                                                                                     |
| `image.repository`                           | `Image name`                                                          | `"opensrp/opensrp-web"`                                                                           |
| `image.pullPolicy`                           | `Image pull policy`                                                   | `"IfNotPresent"`                                                                                  |
| `image.tag`                                  | `Image tag`                                                           | `"v1.0.5"`                                                                                        |
| `imagePullSecrets`                           |                                                                       | `[]`                                                                                              |
| `nameOverride`                               | `Paritally overrides opensrp-web.fullname`                            | `""`                                                                                              |
| `fullnameOverride`                           | `Fully Overrides opensrp-web.fullname`                                | `""`                                                                                              |
| `serviceAccount.create`                      | `Created Serivce Accounts for the setup`                              | `true`                                                                                            |
| `serviceAccount.annotations`                 |                                                                       | `{}`                                                                                              |
| `serviceAccount.name`                        |                                                                       | `""`                                                                                              |
| `podAnnotations`                             | `if recreatePodsWhenConfigMapChange is false then default will be {}` | `{{checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . \| sha256sum }}}}` |
| `podSecurityContext`                         |                                                                       | `{}`                                                                                              |
| `securityContext`                            |                                                                       | `{}`                                                                                              |
| `service.type`                               |                                                                       | `"ClusterIP"`                                                                                     |
| `service.port`                               |                                                                       | `8080`                                                                                            |
| `ingress.enabled`                            |                                                                       | `false`                                                                                           |
| `ingress.className`                          |                                                                       | `""`                                                                                              |
| `ingress.annotations`                        |                                                                       | `{}`                                                                                              |
| `ingress.hosts`                              |                                                                       | `[{"host": "opensrp-web.local", "paths": [{"path": "/", "pathType": "ImplementationSpecific"}]}]` |
| `ingress.tls`                                |                                                                       | `[]`                                                                                              |
| `resources`                                  |                                                                       | `{}`                                                                                              |
| `autoscaling.enabled`                        |                                                                       | `false`                                                                                           |
| `autoscaling.minReplicas`                    |                                                                       | `1`                                                                                               |
| `autoscaling.maxReplicas`                    |                                                                       | `100`                                                                                             |
| `autoscaling.targetCPUUtilizationPercentage` |                                                                       | `80`                                                                                              |
| `nodeSelector`                               |                                                                       | `{}`                                                                                              |
| `tolerations`                                |                                                                       | `[]`                                                                                              |
| `affinity`                                   |                                                                       | `{}`                                                                                              |
| `commonLabels`                               |                                                                       | `{}`                                                                                              |
| `vpa.enabled`                                | `Whether to enable vertical pod autoscaling`                          | `true`                                                                                            |
| `vpa.updatePolicy`                           | `The update policy to use with the vertical pod autoscaler`           | `updateMode: "Off"`                                                                               |
| `pdb.enabled` | `Whether to enable pod disruption budget` | `false` |
| `pdb.minAvailable` | `Number of pods that must be available during a disruption. Can be an absolute number or a percentage` | `1` |
| `pdb.maxUnavailable` | `Number of pods that can be unavailable during a disruption. Can be an absolute number or a percentage` | `""` |

## Opensrp Web Parameters

The following table lists the configurable parameters of the Opensrp-web chart and their default values.

| Parameter                                                             | Description | Default                                                                                                                            |
| --------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `recreatePodsWhenConfigMapChange`                                     |             | `true`                                                                                                                             |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_AUTHORIZATION_URL`     |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/realms/{{ .sharedVars.keycloakRealm }}/protocol/openid-connect/auth"`                 |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_ACCESS_TOKEN_URL`      |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/realms/{{ .sharedVars.keycloakRealm }}/protocol/openid-connect/token"`                |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_CALLBACK_URL`          |             | `"https://{{ .sharedVars.appDomainName }}/oauth/callback/OpenSRP/"`                                                                |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_USER_URL`              |             | `"https://{{ .Values.sharedVars.keycloakUrl }}/auth/realms/{{ .Values.sharedVars.keycloakRealm }}/protocol/openid-connect/userinfo"`|
| `containerEnvironmentVariables.EXPRESS_OPENSRP_CLIENT_ID`             |             | `"{{ .sharedVars.opensrpClientId }}"`                                                                                              |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_CLIENT_SECRET`         |             | `"{{ .sharedVars.opensrpClientSecret }}"`                                                                                          |
| `containerEnvironmentVariables.EXPRESS_SESSION_NAME`                  |             | `"{{ .Release.Name }}-{{ .Release.NameSpace }}"`                                                                                   |
| `containerEnvironmentVariables.EXPRESS_OAUTH_GET_STATE_URL`           |             | `"https://{{ .sharedVars.appDomainName }}/oauth/state"`                                                                            |
| `containerEnvironmentVariables.EXPRESS_SESSION_SECRET`                |             | `"{{ .express.sessionSecret }}"`                                                                                                   |
| `containerEnvironmentVariables.EXPRESS_FRONTEND_OPENSRP_CALLBACK_URL` |             | `"https://{{ .sharedVars.appDomainName }}/fe/oauth/callback/opensrp"`                                                              |
| `containerEnvironmentVariables.EXPRESS_REACT_BUILD_PATH`              |             | `"{{ .express.reactBuildPath }}"`                                                                                                  |
| `containerEnvironmentVariables.NODE_ENV`                              |             | `"{{ .express.nodeEnv }}"`                                                                                                         |
| `containerEnvironmentVariables.EXPRESS_FRONTEND_LOGIN_URL`            |             | `"{{ .express.frontEndLoginUrl }}"`                                                                                                |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_OAUTH_STATE`           |             | `"{{ .express.opensrpOauthState }}"`                                                                                               |
| `containerEnvironmentVariables.EXPRESS_SESSION_PATH`                  |             | `"{{ .express.sessionPath }}"`                                                                                                     |
| `containerEnvironmentVariables.EXPRESS_SESSION_LOGIN_URL`             |             | `"{{ .express.sessionLoginUrl }}"`                                                                                                 |
| `containerEnvironmentVariables.EXPRESS_SESSION_FILESTORE_PATH`        |             | `"/tmp/express-sessions"`                                                                                                          |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_LOGOUT_URL`            |             | `"https://{{ .Values.sharedVars.opensrpServer }}/opensrp/logout.do"`                                                               |
| `containerEnvironmentVariables.EXPRESS_PRELOADED_STATE_FILE`          |             | `"{{ .express.preloadedStateFile }}"`                                                                                              |
| `containerEnvironmentVariables.EXPRESS_LOGS_FILE_PATH`                |             | `"./logs/error.log"`                                                                                                               |
| `containerEnvironmentVariables.EXPRESS_COMBINED_LOGS_FILE_PATH`       |             | `"./logs/error-and-info.log"`                                                                                                      |
| `containerEnvironmentVariables.EXPRESS_KEYCLOAK_LOGOUT_URL`           |             | `"https://{{ .Values.sharedVars.keycloakUrl }}/auth/realms/{{ .Values.sharedVars.keycloakRealm }}/protocol/openid-connect/logout"` |
| `containerEnvironmentVariables.EXPRESS_REDIS_STAND_ALONE_URL`          | this env is only injected if .Values.express.redisStandAloneUrl is defined. Not injected by default                                                                   |                                                                                                                                    |
| `containerEnvironmentVariables.EXPRESS_REDIS_SENTINEL_CONFIG`          | this env is only injected if .Values.express.redisSentinelConfig is defined. Not injected by default                                                                  |                                                                                                                                    |
| `containerEnvironmentVariables.EXPRESS_CONTENT_SECURITY_POLICY_CONFIG`|             | `"(.Values.express.csp \| toJson)"` |
| `containerEnvironmentVariables.EXPRESS_OPENSRP_SCOPES`                |             | `"openid,profile"`                                                                                                                 |
| `containerEnvironmentVariables.NODE_ENV`                              |             | `"production"`                                                                                                                     |
| `containerEnvironmentVariables.EXPRESS_TEMP_CSV_FILE_STORAGE`         |             | `"/tmp/csvUploads"`                                                                                                                |
| `containerEnvironmentVariables.EXPRESS_PYTHON_INTERPRETER_PATH`       |             | `"/usr/local/bin/python"`                                                                                                          |
| `containerEnvironmentVariables.EXPRESS_BULK_UPLOAD_REDIS_QUEUE`       |             | `null`                                                                                                                             |
| `reactEnvironmentVariables.REACT_APP_DOMAIN_NAME`                     |             | `"https://{{ .sharedVars.appDomainName }}"`                                                                                        |
| `reactEnvironmentVariables.REACT_APP_EXPRESS_OAUTH_GET_STATE_URL`     |             | `"https://{{ .sharedVars.appDomainName }}/oauth/state"`                                                                            |
| `reactEnvironmentVariables.REACT_APP_EXPRESS_OAUTH_LOGOUT_URL`        |             | `"https://{{ .sharedVars.appDomainName }}/logout"`                                                                                 |
| `reactEnvironmentVariables.REACT_APP_KEYCLOAK_API_BASE_URL`           |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/admin/realms/{{ .sharedVars.keycloakRealm }}"`                                        |
| `reactEnvironmentVariables.REACT_APP_KEYCLOAK_LOGOUT_URL`             |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/realms/{{ .sharedVars.keycloakRealm }}/protocol/openid-connect/logout"`               |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_ACCESS_TOKEN_URL`        |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/realms/{{ .sharedVars.keycloakRealm }}/protocol/openid-connect/token"`                |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_AUTHORIZATION_URL`       |             | `"https://{{ .sharedVars.keycloakUrl }}/auth/realms/{{ .sharedVars.keycloakRealm }}/protocol/openid-connect/auth"`                 |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_LOGOUT_URL`              |             | `"https://{{ .sharedVars.opensrpServer }}/opensrp/logout.do"`                                                                      |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_USER_URL`                |             | `"https://{{ .Values.sharedVars.keycloakUrl }}/auth/realms/{{ .Values.sharedVars.keycloakRealm }}/protocol/openid-connect/userinfo"`|
| `reactEnvironmentVariables.REACT_APP_OPENSRP_API_BASE_URL`            |             | `"https://{{ .sharedVars.opensrpServer }}/opensrp/rest/"`                                                                          |
| `reactEnvironmentVariables.REACT_APP_FHIR_API_BASE_URL`               |             | `"https://{{ .sharedVars.fhirServer }}/fhir"`                                                                                      |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_CLIENT_ID`               |             | `"{{ .sharedVars.opensrpClientId }}"`                                                                                              |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_PATIENTS`            |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_BACKEND_ACTIVE`                  |             | `"true"`                                                                                                                           |
| `reactEnvironmentVariables.REACT_APP_DISABLE_LOGIN_PROTECTION`        |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_ENABLE_OPENSRP_OAUTH`            |             | `"true"`                                                                                                                           |
| `reactEnvironmentVariables.REACT_APP_WEBSITE_NAME`                    |             | `"opensrp-web"`                                                                                                                    |
| `reactEnvironmentVariables.REACT_APP_MAIN_LOGO_SRC`                   |             | `"https://raw.githubusercontent.com/onaio/fhir-web/{{ .Values.image.tag }}/app/src/assets/images/opensrp2-logo.png"`                                         |
| `reactEnvironmentVariables.REACT_APP_DATE_FORMAT`                     |             | `"yyyy-mm-dd"`                                                                                                                     |
| `reactEnvironmentVariables.REACT_APP_ENABLE_TEAMS_ASSIGNMENT_MODULE`  |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.SKIP_PREFLIGHT_CHECK`                      |             | `"true"`                                                                                                                           |
| `reactEnvironmentVariables.REACT_APP_PROJECT_CODE`                    |             | `"core"`                                                                                                                           |
| `reactEnvironmentVariables.REACT_APP_LANGUAGE_CODE`                   |             | `"en"`                                                                                                                             |
| `reactEnvironmentVariables.REACT_APP_SUPPORTED_LANGUAGES`             |             | `"en,fr"`                                                                                                                             |
| `reactEnvironmentVariables.REACT_APP_ENABLE_LANGUAGE_SWITCHER`        |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_HEALTHCARE_SERVICES` |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_USER_MANAGEMENT`     |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_FHIR_PATIENT_BUNDLE_SIZE`        |             | `"1000"`                                                                                                                           |
| `reactEnvironmentVariables.REACT_APP_DEFAULTS_TABLE_PAGE_SIZE`        |             | `"10"`                                                                                                                             |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_LOCATIONS`           |             | `"false"`                                                                                                                          |
| `reactEnvironmentVariables.REACT_APP_FHIR_ROOT_LOCATION_ID`   |             | `""`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_ENABLE_REPORTS`                  |             | `"false"`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_GROUP`               |             | `"false"`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_OPENSRP_OAUTH_SCOPES`            |             | `"openid,profile"`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_ENABLE_FHIR_COMMODITY`           |             | `"false"`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_COMMODITIES_LIST_RESOURCE_ID`    |             | `""`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_FHIR_INVENTORY_LIST_ID`          |             | `""`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_PRACTITIONER_TO_ORG_ASSIGNMENT_STRATEGY`       |             | `"ONE_TO_MANY"`                                                                                                                               |
| `reactEnvironmentVariables.REACT_APP_COLLAPSED_LOGO_SRC`              |             | `"https://github.com/OpenSRP/web/raw/main/app/src/assets/images/opensrp2-logo-small.png"`                                                                                                                               |
| `sharedVars.keycloakUrl`                                              |             | `""`                                                                                                                    |
| `sharedVars.appDomainName`                                            |             | `""`                                                                                                                  |
| `sharedVars.opensrpClientId`                                          |             | `""`                                                                                                                |
| `sharedVars.opensrpServer`                                            |             | `""`                                                                                                                  |
| `sharedVars.keycloakRealm`                                            |             | `""`                                                                                                                  |
| `sharedVars.fhirServer`                                               |             | `""`                                                                                                                     |
| `express.sessionSecret`                                               |             | `"express_sessionSecret"`                                                                                                          |
| `express.opensrpOauthState`                                           |             | `"opensrp"`                                                                                                                        |
| `express.sessionLoginUrl`                                             |             | `"/login"`                                                                                                                         |
| `express.preloadedStateFile`                                          |             | `"/tmp/opensrpState.json"`                                                                                                         |
| `express.frontEndLoginUrl`                                            |             | `"/fe/login"`                                                                                                                      |
| `express.sessionPath`                                                 |             | `"/"`                                                                                                                              |
| `express.reactBuildPath`                                              |             | `"/usr/src/web"`                                                                                                                   |
| `express.nodeEnv`                                                     |             | `"production"`                                                                                                                     |
| `express.redisStandAloneUrl`                                           | Redis connection string for a stand alone redis instance. see <https://github.com/luin/ioredis#connect-to-redis>                                                      |                                                                                                                                    |
| `express.redisSentinelConfig`                                          | Redis connection config object for a redis sentinel instance. see <https://github.com/luin/ioredis#sentinel>                                                          |                                                                                                                                    |
| `express.expressHeaders`                                              | Additional configurable response headers that the express server should return, templates help with re-formatting `report-to`, others will be passed to express as is | `"{report-to: []}"`                                  |
| `express.cspHeaderConfig`                                             |             | `"{}"`                                                                                                                             |
| `sentry.environment`                                                  |             | `"staging"`                                                                                                                        |
| `sentry.tags`                                                         |             | `{}`                                                                                                                               |
| `sentry.domain`                                                       |             | `""`                                                                                                                               |
| `sentry.projectId`                                                    | id of the associated project on the sentry server             | `""`                                                                                        |
| `sentry.sentryKey`                                                    | public client key that for the associated sentry project            | `sentryKey`                                                                          |

## Express Headers
The express application response headers can be configured from the envs via the `expressHeaders` config. This config is a map whose keys represents an actual header key.

This chart comes with a bit of support for the `report-to` header, whilst you can define the different reporting endpoints configs as a json array, its further formatted into a comma delimited string, however all other envs are passed to the environment as they are.

### examples

```yaml
express:
    expressHeaders:
      report-to:
        - group: "csp-endpoint"
          max_age: 10886400
          endpoints:
            - url: "https://example.com/csp-reporting"
      cache-control: "max-age=604800"
```

## Session Storage

The default session storage mechanism is file store. This however, prevents pods from being scaled. OpenSRP Web >= `v2.1.0` (Opensrp express-server >= `v1.4.0`) now supports session storage on redis (both standalone and sentinel instances).

You can use a standalone redis deployment by defining the express.redisStandAloneUrl config:

```yaml
express:
  redisStandAloneUrl: "redis://username:password@redis-master.opensrp.svc.cluster.local:6379/4"
```

Or a redis sentinel instance by defining the express.redisSentinelConfig config:

```yaml
express:
  redisSentinelConfig:
    name: "sentinelMasterName"
    sentinelPassword: "password"
    sentinels:
      - host: "redis-node-0.redis-headless.redis-sentinel.svc.cluster.local"
        port: "6379"
      - host: "redis-node-1.redis-headless.redis-sentinel.svc.cluster.local"
        port: "6379"
      - host: "redis-node-2.redis-headless.redis-sentinel.svc.cluster.local"
        port: "6379"
```
