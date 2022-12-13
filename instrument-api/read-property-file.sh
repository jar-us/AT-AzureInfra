#!/bin/sh

PROPERTY_FILE=container-config.properties

function getProperty {
  PROP_KEY=$1
  PROP_VALUE=$(cat $PROPERTY_FILE | grep "$PROP_KEY" | cut -d'=' -f2)
  echo $PROP_VALUE
}

echo "# Reading property from $PROPERTY_FILE"
REPOSITORY_URL=$(getProperty "containerHost")
echo $REPOSITORY_URL
