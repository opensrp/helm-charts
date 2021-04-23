{{- define "config.react.config.js" }}
window._env_ = {
{{ (include "opensrp-web.reactEnvironmenVariables" . | trim | trimSuffix ",")  }}
};
{{- end }}