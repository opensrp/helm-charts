
  
# Opensrp Server Web

[OpenSRP](https://smartregister.org) is an open-source, mobile-first platform, built to enable data-driven decision making at all levels of the health system.

## TL;DR

```bash
$ helm repo add opensrp https://helm.smartregister.org
$ helm install opensrp-server opensrp/opensrp-server-web
```

## Introduction

This chart bootstraps  [opensrp server web](https://github.com/OpenSRP/opensrp-server-web) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

## Installing the Chart

To install the chart with the release name `opensrp-server`:
## Prerequisites for installing Opensrp Server Web
1 Postgres Database
Follow this [Installing Postgres on k8s](https://github.com/bitnami/charts/tree/master/bitnami/postgresql/#installing-the-chart) if you dont have postgres installed.
`
2 User Management Application
- For image tag  `2.1.*`
	- **Openmrs** is required for user management. Currently supported version is 2.1.3 and 2.1.4							
- For image tag  `2.2.* and above`
	- **Keycloak** is used for user management. Follow [Installing keycloak on k8s](https://github.com/bitnami/charts/tree/master/bitnami/keycloak/#installing-the-chart)

Will be responsible for authentication.
3. Redis for cache
Follow [Installing redis on k8s](https://github.com/bitnami/charts/tree/master/bitnami/redis/#installing-the-chart).

Find latest docker images [here](https://hub.docker.com/r/opensrp/opensrp-server-web/tags?page=1&ordering=last_updated).

Then update `values.yaml` as such:

for example in `v2.1.*` 
```yaml
image:  
  tag: "v2.1.53.1-SNAPSHOT"  
ingress:  
  enabled: true  
  annotations:  
    kubernetes.io/ingress.class: nginx  
    kubernetes.io/tls-acme: "true"  
  cert-manager.io/cluster-issuer: "YourClusterIssuer"  
  cert-manager.io/acme-challenge-type: http01  
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"  
  hosts:  
    - host: <host-domain>  
      paths: ["/opensrp"] 
  tls:  
    - secretName: opensp-server-web-org-tls  
      hosts:  
        - <https-url>
  
postgres:  
  host: "<host>"  
  port: 5432  
  database: "<your database>"  
  username: <psql-username>
  password: <psql-password>
  
opensrp:  
  cors_allowed_source: "*"  
  
redis:  
  host: <host> 
  port: 6379  
  pool_max_connections: 25
  password: <redis-password>  
  
openmrs:  
  url: "<openmrs-url>"  
  
spring_active_profiles:  
  - postgres  
  - jedis  
  - oauth2  
  - openmrs-sync  
  
oauth_profiles:  
  default:  
    client_id:  <generate client name>   
    secret: <generate secret>  
    grant_types:  
      - password  
      - authorization_code  
      - refresh_token  
      - implicit  
    scope:  
      - read  
      - write  
      - trust  
    token_validity: 3600  
    callback_url: ""  
    roles:  
      - ROLE_CLIENT
```
for `v2.2.* and above` 
```yaml
image:  
  tag: "v2.6.1-SNAPSHOT"  
ingress:  
  enabled: true  
  annotations:  
    kubernetes.io/ingress.class: nginx  
    kubernetes.io/tls-acme: "true"  
  cert-manager.io/cluster-issuer: "YourClusterIssuer"  
  cert-manager.io/acme-challenge-type: http01  
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"  
  hosts:  
    - host: <host-domain>  
      paths: ["/opensrp"] 
  tls:  
    - secretName: opensp-server-web-org-tls  
      hosts:  
        - <https-url>
  
postgres:  
  host: "<host>"  
  port: 5432  
  database: "<your database>"  
  username: <psql-username>
  password: <psql-password>
  
opensrp:  
  cors_allowed_source: "*"  
  
redis:  
  host: <host> 
  port: 6379  
  pool_max_connections: 25
  password: <redis-password>  
  
keycloak_json:  
  realm: "<realm-name>"  
  auth-server-url: "https://<keycloak-url>/auth/"  
  ssl-required: "none"  
  resource: "<client-name>"  
  confidential-port: 443  
  credentials:
    secret: "<client-id>"
  
```
and finally,
```bash
$ helm install opensrp-server opensrp/opensrp-server-web -f values.yaml
```

The command deploys Opensrp Server on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `opensrp-server` deployment:

```bash
$ helm delete opensrp-server
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
  
## Parameters  
  
The following table lists the configurable parameters of the Opensrp-server-web chart and their default values.  

## Common Parameters
| Parameter                | Description             | Default        |  
| ------------------------ | ----------------------- | -------------- |  
| `replicaCount` | `Number of pods` | `1` |  
| `image.registry` | `Image regsitry` | `"docker.io"` |  
| `image.repository` | `Image name` | `"opensrp/opensrp-server-web"` |  
| `image.pullPolicy` | `Image pull policy` | `"IfNotPresent"` |  
| `image.tag` | `Image tag` | `"v2.6.1-SNAPSHOT"` |  
| `imagePullSecrets` |  | `[]` |  
| `nameOverride` | `Paritally overrides opensrp-server-web.fullname` | `""` |  
| `fullnameOverride` | `Fully Overrides opensrp-server-web.fullname`  | `""` |  
| `serviceAccount.create` | `Created Serivce Accounts for the setup` | `true` |  
| `serviceAccount.annotations` |  | `{}` |  
| `serviceAccount.name` |  | `""` |  
| `podAnnotations` | `if recreatePodsWhenConfigMapChange is false then default will be {}` | `{{checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . \| sha256sum }}}}` |  
| `podSecurityContext` |  | `{}` |  
| `securityContext` |  | `{}` |  
| `service.type` |  | `"ClusterIP"` |  
| `service.port` |  | `8080` |  
| `ingress.enabled` |  | `false` |  
| `ingress.annotations` |  | `{}` |  
| `ingress.hosts` |  | `[{"host": "opensrp-server-web.local", "paths": []}]` |  
| `ingress.tls` |  | `[]` |  
| `resources` |  | `{}` |  
| `autoscaling.enabled` |  | `false` |  
| `autoscaling.minReplicas` |  | `1` |  
| `autoscaling.maxReplicas` |  | `100` |  
| `autoscaling.targetCPUUtilizationPercentage` |  | `80` |  
| `nodeSelector` |  | `{}` |  
| `tolerations` |  | `[]` |  
| `affinity` |  | `{}` |  

## Opensrp Server Web  Parameters
| Parameter                | Description             | Default        |  
| ------------------------ | ----------------------- | -------------- |  
| `recreatePodsWhenConfigMapChange` | `If true will recreate pods when any of the config maps parameter change` | `true` |
| `postgres.host` |  `url or ip to your postgres db`  | `"db"` |
| `postgres.port` |  | `5432` | 
| `postgres.username` |  | `"opensrp"` |  
| `postgres.password` |  | `"password"` |  
| `postgres.database` |  | `"opensrp"` |  
| `time_zone` |  | `"GMT+0:00"` |  
| `readinessProbe.initialDelaySeconds` | | `120` |  |
| `livenessProbe.initialDelaySeconds` |  | `120` | 
| `mybatis.core_tablespace` |  | `"pg_default"` |  
| `mybatis.error_tablespace` |  | `"pg_default"` |  
| `mybatis.schedule_tablespace` |  | `"pg_default"` |  
| `mybatis.feed_tablespace` |  | `"pg_default"` |  
| `mybatis.form_tablespace` |  | `"pg_default"` |  
| `opensrp.sms_can_be_sent` |  | `false` |  
| `opensrp.number_of_audit_messages` |  | `1000` |  
| `opensrp.use_opensrp_team_module` |  | `false` |  
| `opensrp.plan_evaluation_enabled` |  | `false` |  
| `opensrp.multimedia_file_manager` |  | `"S3MultimediaFileManager"` |  
| `opensrp.multimedia_allowed_file_types` |  | `"application/octet-stream,image/jpeg,image/gif,image/png"` |  
| `opensrp.file_max_upload_size` |  | `"20971520"` |  
| `opensrp.cors_allowed_source` |  | `null` |  
| `opensrp.cors_max_age` |  | `60` |  
| `opensrp.sync_search_missing_client` |  | `false` |  
| `opensrp.authencation_cache_ttl` |  | `120` |  
| `opensrp.config_global_id` |  | `"OPENSRP_ID"` |  
| `openmrs.url` |  | `"http://localhost:8080/openmrs/"` |  
| `openmrs.username` |  | `"admin"` |  
| `openmrs.password` |  | `"Admin123"` |  
| `openmrs.idgen_url` |  | `"/module/idgen/exportIdentifiers.form"` |  
| `openmrs.idgen_initial_batchsize` |  | `300000` |  
| `openmrs.idgen_batchsize` |  | `100` |  
| `openmrs.idgen_idsource` |  | `1` |  
| `openmrs.version` |  | `"2.1.3"` |  
| `openmrs.test_make_rest_call` |  | `false` |  
| `openmrs.scheduletracker_syncer_interval_min` |  | `2` |  
| `dhis2.url` |  | `"http://dhis2-url/api/"` |  
| `dhis2.username` |  | `"path"` |  
| `dhis2.password` |  | `"Path@123"` |  
| `couchdb.server` |  | `"localhost"` |  
| `couchdb.port` |  | `5984` |  
| `couchdb.username` |  | `"rootuser"` |  
| `couchdb.password` |  | `"adminpass"` |  
| `couchdb.atomfeed_db_revision_limit` |  | `2` |  
| `rapidpro.url` |  | `"https://rapidpro-url/"` |  
| `rapidpro.token` |  | `"YOUR_AUTH_TOKEN"` |  
| `redis.host` |  | `"redis"` |  
| `redis.port` |  | `6379` |  
| `redis.password` |  | `""` |  
| `redis.pool_max_connections` |  | `25` |  
| `object_storage.access_key_id` |  | `"dummy"` |  
| `object_storage.secret_access_key` |  | `"dummy"` |  
| `object_storage.region` |  | `"dummy"` |  
| `object_storage.bucket_name` |  | `"dummy"` |  
| `object_storage.bucket_folder_path` |  | `"dummy"` |  
| `schedule.event_add_serverVersion_interval` |  | `180000` |  
| `schedule.view_add_serverVersion_interval` |  | `120000` |  
| `schedule.task_add_serverVersion_interval` |  | `120000` |  
| `schedule.location_add_serverVersion_interval` |  | `120000` |  
| `schedule.openmrs_sync_interval` |  | `300000` |  
| `schedule.openmrs_validate_interval` |  | `420000` |  
| `schedule.dhis2_sync_interval` |  | `600000` |  
| `keycloak.configuration_endpoint` |  | `"{0}realms/{1}/.well-known/openid-configuration"` |  
| `keycloak.password_reset_endpoint` |  | `"{0}realms/{1}/account/credentials/password"` |  
| `keycloak.users_endpoint` |  | `"{0}/admin/realms/{1}/users"` |  
| `keycloak_json.realm` |  | `""` |  
| `keycloak_json.auth-server-url` |  | `"https://keycloak-url/auth/"` |  
| `keycloak_json.ssl-required` |  | `"external"` |  
| `keycloak_json.resource` |  | `""` |  
| `keycloak_json.credentials.secret` |  | `""` |  
| `keycloak_json.confidential-port` |  | `0` |  
| `rabbitmq.host` |  | `"localhost"` |  
| `rabbitmq.virtualhost` |  | `"/"` |  
| `rabbitmq.port` |  | `5672` |  
| `rabbitmq.username` |  | `""` |  
| `rabbitmq.password` |  | `""` |  
| `rabbitmq.exchange` |  | `"exchange"` |  
| `rabbitmq.queue` |  | `"task.queue"` |  
| `rabbitmq.routingkey` |  | `"rabbitmq.routingkey"` |  
| `rabbitmq.reply_timeout` |  | `60000` |  
| `rabbitmq.concurrent_consumers` |  | `1` |  
| `rabbitmq.max_concurrent_consumers` |  | `1` |  
| `spring_active_profiles` |  | `["postgres", "jedis", "oauth2"]` |  
| `oauth_profiles` | `(Array)` | `null` |  
| `tomcatRemoteIpValve.className` | | `"org.apache.catalina.valves.RemoteIpValve"` |
| `tomcatRemoteIpValve.protocolHeader` |  | `"x-forwarded-proto"` |
| `tomcatRemoteIpValve.proxiesHeader` |  | `"x-forwarded-by"` |
| `tomcatRemoteIpValve.remoteIpHeader` |  | `"x-forwarded-for"` |
| `useTomcatRemoteIpValve` |  | `false` |