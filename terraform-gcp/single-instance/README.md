## Compute Instance

Creates a single compute instance (Ubuntu LTS 18.04) in GCP using terraform.

_Remember to change the GCP project name in `vars.tf` to whatever you've created when running the `gcp_prep.sh script_

To connect to the created GCE instance run:
```
gcloud compute ssh INSTANCE_NAME
```