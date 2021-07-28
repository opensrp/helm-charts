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
{{- define "opensrp-web.reactEnvironmenVariables" -}}
{{- $scope := . -}}
{{ range  $key, $value := index .Values.reactEnvironmentVariables }}
{{- $key -}}:{{- tpl $value $scope | quote -}},
{{ end }}
{{- end }}

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