
{{- define "config.server.application.yaml" }}
{{ tpl .Values.applicationConfig . }}
{{- end }}