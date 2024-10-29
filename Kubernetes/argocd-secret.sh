#!/bin/bash

# Name of the Kubernetes secret
SECRET_NAME="argocd-initial-admin-secret" 


NAMESPACE="argocd" 

# Extract the password from the secret and decode it
PASSWORD=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath="{.data.password}" | base64 --decode)

# Print the decoded password
echo "Decoded password: $PASSWORD"
