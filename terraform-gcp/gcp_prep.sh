#!/bin/bash

#
# GCP preparation script
#

# Changes these variables if needed
PROJECT_ID="sandbox"
PROJECT_NAME="Sandbox"
SA_ACC_NAME="terraform"

if ! command -v gcloud; then
    echo "Please install gloud or make sure you installed it correctly.."
    exit 1
elif ! command -v terraform; then
    echo "Please install terraform or make sure you installed it correctly.."
    exit 1
fi

echo "Checking for updates.."
gcloud components update

echo "Trying to install the alpha commands.."
gcloud components install alpha

echo "Creating a new project and enable cloud APIs.."
gcloud projects create ${PROJECT_ID} --name "${PROJECT_NAME}" --set-as-default --enable-cloud-apis
gcloud services enable cloudapis.googleapis.com --async
gcloud services enable container.googleapis.com --async

echo "Linking the billing account to the new project.."
BILLING_ACC_ID=$(gcloud alpha billing accounts list | tail -1 | awk '{print $1}')
gcloud alpha billing projects link ${PROJECT_ID} --billing-account=${BILLING_ACC_ID}

echo "Create the service-account used by terraform"
gcloud iam service-accounts create ${SA_ACC_NAME} --display-name="${SA_ACC_NAME} service account"

echo "Add an IAM policy binding to the service-account adding a number of roles needed.."
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:${SA_ACC_NAME}@${PROJECT_ID}.iam.gserviceaccount.com --role roles/compute.admin
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:${SA_ACC_NAME}@${PROJECT_ID}.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:${SA_ACC_NAME}@${PROJECT_ID}.iam.gserviceaccount.com --role roles/container.admin

echo "Create the service-account keys and store them locally to be used by ${SA_ACC_NAME}.."
gcloud iam service-accounts keys create --iam-account ${SA_ACC_NAME}@${PROJECT_ID}.iam.gserviceaccount.com ~/.config/gcloud/${SA_ACC_NAME}_sa_key.json