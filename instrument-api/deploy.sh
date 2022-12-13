#!/usr/bin/env zsh

# This script is used to login azure with service principal

AZURE_TENANT_ID="eab1a252-2056-4d98-a9b5-795e871ad685"
AZURE_CLIENT_ID="9f642d8b-8301-4df8-8c28-753408d58d4f"
AZURE_CLIENT_SECRET="e~d8Q~OlqtbaqQgYiX1JlcKg7v1AmYXk~~MuUbMh"
AZURE_LOCATION="centralindia"
AZURE_RESOURCE_GROUP="instrument-api"
AZURE_CONTAINER_NAME="instrument-api"
AZURE_CONTAINER_IMAGE="suraj123456789/instrument-api"
AZURE_CONTAINER_PORT="8080"
AZURE_CONTAINER_DNS="instrument-api"

az login \
  --service-principal \
  -u "$AZURE_CLIENT_ID" \
  -p "$AZURE_CLIENT_SECRET" \
  --tenant "$AZURE_TENANT_ID" >responses/login.json

az group create \
  --name "$AZURE_RESOURCE_GROUP" \
  --location "$AZURE_LOCATION" >responses/createResourceGroup.json

az container create \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --name "$AZURE_CONTAINER_NAME" \
  --image "$AZURE_CONTAINER_IMAGE" \
  --ports "$AZURE_CONTAINER_PORT" \
  --dns-name-label "$AZURE_CONTAINER_DNS" >responses/createContainer.json

az container show \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --name "$AZURE_CONTAINER_NAME" \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" >responses/containerStatus.json

az logout
