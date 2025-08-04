#!/bin/bash

export SCW_PROJECT_ID="project_01J1111111111111111111111"
export NAMESPACE="app-nginx"

NUMBER_OF_SECRETS=$(scw secret secret list -o json | jq "length")
SECRETS_UUIDS=$(scw secret secret list -o json | jq "[.[].id]")
SECRETS_NAMES=$(scw secret secret list -o json | jq "[.[].name]")

for i in $(seq 0 $((NUMBER_OF_SECRETS-1))); do
    SECRET_UUID=$(echo "$SECRETS_UUIDS" | jq -r ".[$i]")
    SECRET_NAME=$(echo "$SECRETS_NAMES" | jq -r ".[$i]")
    SECRET_DATA=$(scw secret version access "$SECRET_UUID" revision=latest raw=true -o json)
    
    kubectl create secret generic "$SECRET_NAME" \
        --from-literal=MY_SECRET="$SECRET_DATA" \
        --namespace="$NAMESPACE" \
        --dry-run=client -o yaml | kubectl apply -f -
done

unset SCW_PROJECT_ID
