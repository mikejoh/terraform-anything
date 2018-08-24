# Terraforming in GCP

This repository contains a number of (simple) examples that shows you how easy (!) it is to create different kinds of resources and clusters in GCP.

## Getting started

### Pre-requisites
1. Create a free tier GCP account
2. Download and install `gcloud`
3. Download and install `terraform`

### How-to
1. Change the required variables in the `gcp_prep.sh` script
2. Run the `gcp_prep.sh` script to prepare GCP
3. Inside any of the sub-directories run:
```
terraform init
terraform plan -out CHANGE_THIS.plan
terraform apply CHANGE_THIS.plan
```