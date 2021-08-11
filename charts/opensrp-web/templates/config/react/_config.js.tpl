{{- define "config.react.config.js" }}
window._env_ = {
{{ (include "opensrp-web.reactEnvironmentVariables" . | trim | trimSuffix ",")  }}
};
{{- end }}