{{- define "config.default.json" }}
{{ tpl .Values.defaultJson . }}
{{- end }}