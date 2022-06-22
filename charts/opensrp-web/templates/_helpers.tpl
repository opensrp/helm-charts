{{/*
Expand the name of the chart.
*/}}
{{- define "opensrp-web.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "opensrp-web.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "opensrp-web.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "opensrp-web.labels" -}}
helm.sh/chart: {{ include "opensrp-web.chart" . }}
{{ include "opensrp-web.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- range $index, $element := .Values.commonLabels }}
{{ $index }}: {{ $element }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "opensrp-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opensrp-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "opensrp-web.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "opensrp-web.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}



{{/*
Dynamically add React environment variables
*/}}
{{- define "opensrp-web.reactEnvironmentVariables" -}}
{{- $scope := . -}}
{{ range  $key, $value := index .Values.reactEnvironmentVariables }}
{{- $key -}}:{{- tpl $value $scope | quote -}},
{{ end -}}
REACT_APP_SENTRY_CONFIG_JSON: {{ (include "opensrp-web.sentryConfig" $scope ) | quote }},
{{- end }}


{{/*
Get opensrp-webs sentry tags
*/}}
{{- define "opensrp-web.sentryConfig" }}
{{- $sentryMap := pick .Values.sentry "environment" -}}
{{- $tagsMap := pick .Values.sentry "tags" -}}
{{- $_ := set $tagsMap "release-name" (.Release.Name) -}}
{{- $_ := set $tagsMap "release-namespace" (.Release.Namespace) -}}
{{- if and .Values.sentry.sentryKey .Values.sentry.domain .Values.sentry.projectId -}}
{{- $_ := set $sentryMap "dsn" (printf "https://%s@%s/%s" .Values.sentry.sentryKey .Values.sentry.domain .Values.sentry.projectId) -}}
{{- end -}}
{{- $sentryConfigs := merge $sentryMap $tagsMap -}}
{{- $_ := set $sentryConfigs "release" .Values.image.tag -}}
{{- $sentryConfigs | toJson -}}
{{- end }}

{{/*
Define express headers config, helps with reformatting where needed.
*/}}
{{- define "opensrp-web.expressResponseHeaders" -}}
{{- $scope := . -}}
{{- $expressHeaderConfig := get .Values.express "expressHeaders" -}}
{{- $reportTo := get $expressHeaderConfig "report-to" -}}
{{- $otherHeaders := omit $expressHeaderConfig "report-to" -}}
{{- if $reportTo -}}
{{- $stringified := "" -}}
{{- range $index, $reportEndpoint := $reportTo }}
{{- $stringified = print $stringified ", " (tpl ($reportEndpoint | toJson) $scope) -}}
{{- end -}}
{{- $_ := set $otherHeaders "report-to" $stringified  -}}
{{- end -}}
{{ $otherHeaders | toJson | quote }}
{{- end -}}


{{/*
Dynamically add express environment variables
*/}}
{{- define "opensrp-web.containerEnvironmentVariables" -}}
{{- $scope := . -}}
{{- range  $key, $value := .Values.containerEnvironmentVariables }}
- name: {{ $key }}
  value: {{ (tpl $value $scope) | quote }}
{{- end }}
- name: "EXPRESS_RESPONSE_HEADERS"
  value: {{ include "opensrp-web.expressResponseHeaders" $scope }}
{{- end -}}

{{/*
Populate the pod annotations
*/}}
{{- define "opensrp-web.podAnnotations" -}}
{{- range $index, $element:=.Values.podAnnotations }}
{{ $index }}: {{ $element }}
{{- end }}
{{- if .Values.recreatePodsWhenConfigMapChange }}
checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
{{- end }}
{{- end }}

{{/* inject optional redis environment variable configs if available*/}}
{{- define "opensrp-web.optionalRedisEnvironmentVariables" -}}
{{- if .Values.express.redisStandAloneUrl -}}
- name: EXPRESS_REDIS_URL
  value: "{{ .Values.express.redisStandAloneUrl -}}"
{{- end -}}
{{- if .Values.express.redisSentinelConfig -}}
- name: EXPRESS_REDIS_SENTINEL_CONFIG
  value: {{ .Values.express.redisSentinelConfig | toJson | quote }}
{{- end -}}
{{- end -}}
