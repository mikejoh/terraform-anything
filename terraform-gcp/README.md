# Terraforming in GCP

This repository contains a number of (simple) examples that shows you how easy (!) it is to create different kinds of resources and clusters in GCP.

## Getting started

### Pre-requisites
1. Create a Gmail account or use and existing one to login to [Google Cloud Console](https://console.cloud.google.com/). You have to activate your account and provide billing information to be able to start your $300 worth of credits. 
2. Download and install `gcloud`, see this [link](https://cloud.google.com/sdk/docs/quickstarts) for help
3. Download and install `terraform`, see this [link](https://www.terraform.io/downloads.html) for help

### How-to
1. Run `gcloud init` and login using your 
2. Change the required variables in the `gcp_prep.sh` script
3. Run the `gcp_prep.sh` script to prepare GCP
4. Inside any of the sub-directories run:
```
terraform init
terraform plan
terraform apply
```