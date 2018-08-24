## GKE

Creates a GKE cluster in GCP using `terraform`.

_Remember to change the GCP project name in `vars.tf` to whatever you've created when running the `gcp_prep.sh script_

To access the GKE cluster with `kubectl` run:
```
gcloud container clusters get-credentials CLUSTER_NAME
```