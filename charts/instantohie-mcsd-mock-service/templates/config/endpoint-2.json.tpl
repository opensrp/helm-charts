{{- define "config.endpoint-2.json" }}
{{ tpl .Values.mcsdEndpointImporterJob.endpointJson2 . }}
{{- end }}