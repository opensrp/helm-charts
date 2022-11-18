# OpenSRP Kubernetes Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Publish Charts](https://github.com/opensrp/helm-charts/workflows/Publish%20Charts/badge.svg?branch=main)

This is the OpenSRP community's official repository for [Helm](https://helm.sh) charts. It currently contains charts for deploying the following services on [Kubernetes](https://kubernetes.io/):

1. [OpenSRP Server Web](https://github.com/opensrp/opensrp-server-web)
2. [OpenSRP Web](https://github.com/opensrp/web)
3. [HAPI FHIR](https://github.com/opensrp/hapi-fhir-jpaserver-starter)
4. [OpenHIM Core](https://github.com/jembi/openhim-core-js)
5. [OpenHIM Console](https://github.com/jembi/openhim-console)
6. [DHIS2](https://github.com/dhis2/dhis2-core)
7. [iHRIS](https://github.com/iHRIS/iHRIS)
8. [OpenHIM Mediator Mapping](https://github.com/jembi/openhim-mediator-mapping)
9. OpenHIE Helper Tools: FHIR Extractor, OpenCR, MCSD Mock Service
10. [DHIS2 FHIR Adapter](https://github.com/opensrp/dhis2-fhir-adapter)

## Usage

Helm must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add opensrp https://helm.smartregister.org
```

You can then run `helm search repo opensrp` to see the charts.

## License

[Apache 2.0 License](./LICENSE).
