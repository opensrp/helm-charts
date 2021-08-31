
{{- define "config.server.application.yaml" }}
{{ tpl ( toYaml .Values.applicationConfig ) . }}
{{- end }}