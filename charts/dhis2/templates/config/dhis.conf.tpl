{{- define "config.dhis.conf" }}
{{ tpl .Values.dhisConf . }}
{{- end }}