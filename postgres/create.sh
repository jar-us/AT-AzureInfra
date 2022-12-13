let "randomIdentifier=$RANDOM*$RANDOM"
location="centralindia"
resourceGroup="msdocs-postgresql-rg-$randomIdentifier"
tag="create-postgresql-server-and-firewall-rule"
server="msdocs-postgresql-server-$randomIdentifier"
sku="GP_Gen5_2"
login="azureuser"
password="Pa$$w0rD-$randomIdentifier"
startIp=49.37.240.122
endIp=49.37.240.122
echo "Using resource group $resourceGroup with login: $login, password: $password..."

echo "Creating $resourceGroup in $location..."
az group create \
  --name $resourceGroup \
  --location "$location" \
  --tags $tag >responses/createResourceGroupResponse.json

echo "Creating $server in $location..."
az postgres server create \
  --name $server \
  --resource-group $resourceGroup \
  --location "$location" \
  --admin-user $login \
  --admin-password $password \
  --sku-name $sku >responses/createPostgresServerResponse.json

echo "Configuring a firewall rule for $server for the IP address range of $startIp to $endIp"
az postgres server firewall-rule create \
  --resource-group $resourceGroup \
  --server $server \
  --name AllowIps \
  --start-ip-address $startIp \
  --end-ip-address $endIp >responses/configureFirewallRuleResponse.json

echo "List of server-based firewall rules for $server"
az postgres server firewall-rule list \
  --resource-group $resourceGroup \
  --server-name $server >responses/listOfServerBasedFirewallRulesResponse.json

az postgres server show \
  --resource-group $resourceGroup \
  --name $server >responses/showServerResponse.json
