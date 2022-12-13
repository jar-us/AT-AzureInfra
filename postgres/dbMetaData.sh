echo 'creating postgres-config.properties file..'

cat responses/createPostgresServerResponse.json |
  jq -r '.fullyQualifiedDomainName' |
  awk '{print "postgresHost="$1}' \
    >postgres-config.properties

echo 'updating postgres-config.properties file..'
cat responses/createPostgresServerResponse.json |
  jq -r '.administratorLogin' |
  awk '{print "postgresUser="$1}' \
    >>postgres-config.properties

echo 'updating postgres-config.properties file..'
cat responses/createPostgresServerResponse.json |
  jq -r '.name' |
  awk '{print "postgresName="$1}' \
    >>postgres-config.properties

echo 'updating postgres-config.properties file..'
cat responses/createPostgresServerResponse.json |
  jq -r '.password' |
  awk '{print "postgresPassword="$1}' \
    >>postgres-config.properties

echo 'updating postgres-config.properties file..'
cat responses/createPostgresServerResponse.json |
  jq -r '.resourceGroup' |
  awk '{print "resourceGroup="$1}' \
    >>postgres-config.properties
