{{- define "config.config_instant.json" }}
{
  "auth": {
    "secret": "3084e343-71bc-4247-86e4-ea210af89c28",
    "tokenDuration": 5400
  },
  "app": {
    "port": {{ .Values.service.port }},
    "installed": true
  },
  "mediator": {
    "api": {
      "username": "{{ .Values.openhimCoreConfiguration.username }}",
      "password": "{{ .Values.openhimCoreConfiguration.password }}",
      "apiURL": "{{ .Values.openhimCoreConfiguration.scheme }}://{{ .Values.openhimCoreConfiguration.host }}:{{ .Values.openhimCoreConfiguration.port }}",
      "trustSelfSigned": {{ .Values.openhimCoreConfiguration.trustSelfSigned }},
      "urn": ""
    },
    "register": true
  },
  "fhirServer": {
    "baseURL": "{{ .Values.hapiFhirServerConfiguration.scheme }}://{{ .Values.hapiFhirServerConfiguration.host }}:{{ .Values.hapiFhirServerConfiguration.port }}/fhir",
    "username": "{{ .Values.hapiFhirServerConfiguration.username }}",
    "password": "{{ .Values.hapiFhirServerConfiguration.password }}"
  },
  "elastic": {
    "server": "{{ .Values.esConfiguration.scheme }}://{{ .Values.esConfiguration.host }}:{{ .Values.esConfiguration.port }}",
    "username": "",
    "password": "",
    "max_compilations_rate": "10000/1m",
    "index": "patients"
  },
  "codes": {
    "goldenRecord": "5c827da5-4858-4f3d-a50c-62ece001efea"
  },
  "structureDefinition": {
    "uri": "http://openclientregistry.org/fhir",
    "reportRelationship": "patientreport"
  },
  "matching": {
    "tool": "elasticsearch"
  },
  "clients": [
    {
      "id": "test",
      "displayName": "Instant OpenHIE OpenHIM"
    }
  ],
  "systems": {
    "CRBaseURI": "http://openclientregistry.org/fhir",
    "internalid": {
      "uri": [
        "https://instantopenhie.org/client1",
        "https://instantopenhie.org/client2",
        "https://instantopenhie.org/client3"
      ],
      "displayName": "Internal ID"
    },
    "brokenMatch": {
      "uri": "http://clientregistry.org/brokenMatch"
    }
  },
  "sync": {
    "lastFHIR2ESSync": "2020-02-21T14:51:41"
  },
  "__comments": {
    "matching.tool": "this tells if the app should use mediator algorithms or elasticsearch algorithms for matching, two options mediator and elasticsearch"
  }
}
{{- end }}