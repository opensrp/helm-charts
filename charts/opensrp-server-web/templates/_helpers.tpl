{{/*
Expand the name of the chart.
*/}}
{{- define "opensrp-server-web.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "opensrp-server-web.fullname" -}}
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
{{- define "opensrp-server-web.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "opensrp-server-web.labels" -}}
helm.sh/chart: {{ include "opensrp-server-web.chart" . }}
{{ include "opensrp-server-web.selectorLabels" . }}
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
{{- define "opensrp-server-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opensrp-server-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "opensrp-server-web.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "opensrp-server-web.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Populate the pod annotations
*/}}
{{- define "opensrp-server-web.podAnnotations" -}}
{{- range $index, $element:=.Values.podAnnotations }}
{{ $index }}: {{ $element }}
{{- end }}
{{- if .Values.recreatePodsWhenConfigMapChange }}
checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
{{- end }}
{{- end }}

{{/*
Find the podCIDRPattern
*/}}
{{- define "opensrp-server-web.internalProxies"  -}}
{{- $node := (lookup "v1" "Node" .Release.Namespace "") -}}
{{- if and $node $node.items -}}
{{- $firstNode := ($node.items | first) -}}
{{- $hostPortion :=  (int .Values.hostOctetPortion) -}}
{{- if and ($firstNode) ($firstNode.spec) ($firstNode.spec.podCIDR) -}}
{{- if and ( kindIs "int" $hostPortion ) (gt $hostPortion 0) (lt $hostPortion 4) -}}
{{- $podCIDR := (regexFind (repeat $hostPortion ".\\d{1,3}.") $firstNode.spec.podCIDR) | trimSuffix "." -}}
{{- $podCIDRPattern := (cat $podCIDR  (repeat (int (sub 4 $hostPortion)) ".\\d{1,3}")) | nospace | replace "." "\\." -}}
{{- $podCIDRPattern -}}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Get sentry tags
*/}}
{{- define "opensrp-server-web.sentryTags" }}
{{- $dynamicTagMap := dict "release-name" (.Release.Name) "release-namespace" (.Release.Namespace) -}}
{{- range $index, $element:=.Values.sentry.tags }}
{{- $_ := set $dynamicTagMap $index $element -}}
{{- end }}
{{- $dynamicTagMap | toJson }}
{{- end }}
