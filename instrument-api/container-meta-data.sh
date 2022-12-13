cat responses/containerStatus.json |
  jq -r .FQDN |
  awk '{print "containerHost="$1}' >container-config.properties
