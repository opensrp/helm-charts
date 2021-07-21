{{- define "config.openhim-import.json" }}
{{ tpl .Values.mapperConfigImporterJob.openhimImportJson . }}
{{- end }}