# OpenSRP Kubernetes Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Publish Charts](https://github.com/opensrp/helm-charts/workflows/Publish%20Charts/badge.svg?branch=main)

This is the OpenSRP community's official repository for [Helm](https://helm.sh) charts. It currently contains charts for deploying the following services on [Kubernetes](https://kubernetes.io/):

1. [OpenSRP Server Web](https://github.com/opensrp/opensrp-server-web)
2. [OpenSRP Web](https://github.com/opensrp/web)

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

