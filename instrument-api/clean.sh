#!/usr/bin/env zsh

AZURE_RESOURCE_GROUP="instrument-api"
AZURE_CONTAINER_NAME="instrument-api"
AZURE_TENANT_ID="eab1a252-2056-4d98-a9b5-795e871ad685"
AZURE_CLIENT_ID="9f642d8b-8301-4df8-8c28-753408d58d4f"
AZURE_CLIENT_SECRET="e~d8Q~OlqtbaqQgYiX1JlcKg7v1AmYXk~~MuUbMh"

az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" --tenant "$AZURE_TENANT_ID"

az container delete --resource-group "$AZURE_RESOURCE_GROUP" --name "$AZURE_CONTAINER_NAME"

az container list --resource-group "$AZURE_RESOURCE_GROUP" --output table

az group delete --name "$AZURE_RESOURCE_GROUP"

az logout
