{{- define "config.mediator.json" }}
{
  "urn": "urn:client-package-opencr",
  "version": "1.0.4",
  "name": "Client Registry",
  "description": "Open Client Registry",
  "config": {
    "fhirServer": {
      "username": "{{ .Values.hapiFhirServerConfiguration.username }}",
      "password": "{{ .Values.hapiFhirServerConfiguration.password }}",
      "baseURL": "{{ .Values.hapiFhirServerConfiguration.scheme}}://{{ .Values.hapiFhirServerConfiguration.host }}:{{ .Values.hapiFhirServerConfiguration.port }}/fhir"
    },
    "elastic": {
      "server": "{{ .Values.esConfiguration.scheme }}://{{ .Values.esConfiguration.host }}:{{ .Values.esConfiguration.port }}",
      "username": "",
      "password": "",
      "max_compilations_rate": "10000/1m",
      "index": "patients"
    },
    "matching": {
      "tool": "elasticsearch"
    }
  },
  "configDefs": [
    {
      "param": "fhirServer",
      "displayName": "FHIR Server",
      "description": "FHIR Server Configuration Details",
      "type": "struct",
      "template": [
        {
          "type": "string",
          "description": "The base URL (e.g. {{ .Values.hapiFhirServerConfiguration.host }}/fhir)",
          "displayName": "Base URL",
          "param": "baseURL"
        },
        {
          "type": "string",
          "description": "Username required to access FHIR server",
          "displayName": "Username",
          "param": "username"
        },
        {
          "type": "password",
          "description": "Password required to access FHIR server",
          "displayName": "Password",
          "param": "password"
        }
      ],
      "values": []
    },
    {
      "param": "elastic",
      "displayName": "Elasticsearch Server",
      "description": "Elasticsearch Server Configuration Details",
      "type": "struct",
      "template": [
        {
          "type": "string",
          "description": "The base URL (e.g. http://es:9200)",
          "displayName": "Base URL",
          "param": "server"
        },
        {
          "type": "string",
          "description": "Username required to access elasticsearch server",
          "displayName": "Username",
          "param": "username"
        },
        {
          "type": "password",
          "description": "Password required to access elasticsearch server",
          "displayName": "Password",
          "param": "password"
        },
        {
          "type": "string",
          "description": "Number of requests to compile per minute",
          "displayName": "Maximum Compilations Rate",
          "param": "max_compilations_rate"
        },
        {
          "type": "string",
          "description": "index to use for data storage",
          "displayName": "Index Name",
          "param": "index"
        }
      ],
      "values": []
    },
    {
      "param": "matching",
      "displayName": "FHIR Server",
      "description": "FHIR Server Configuration Details",
      "type": "struct",
      "template": [
        {
          "type": "option",
          "values": [
            "mediator",
            "elasticsearch"
          ],
          "description": "Tool to Use for Matching",
          "displayName": "Tool to Use for Matching",
          "param": "tool"
        }
      ],
      "values": []
    }
  ],
  "endpoints": [
    {
      "name": "Client Registry Endpoint",
      "host": "{{ include "opencr.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local",
      "path": "/fhir",
      "port": {{ .Values.service.port }},
      "primary": true,
      "forwardAuthHeader": false,
      "status": "enabled",
      "type": "http"
    }
  ]
}
{{- end }}