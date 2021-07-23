{{- define "config.endpoint.json" }}
{{ tpl .Values.mcsdEndpointImporterJob.endpointJson . }}
{{- end }}