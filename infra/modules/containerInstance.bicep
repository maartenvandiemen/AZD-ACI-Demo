@description('The tags to associate with the resource')
param tags object

@description('Name of the ACR to use in the same resource group')
param acrName string

@description('Resource ID of the user-assigned identity (with AcrPull on the registry) used to pull the image')
param pullIdentityId string

var containerInstanceName = 'aci-${uniqueString(resourceGroup().id, subscription().id)}'

resource registry 'Microsoft.ContainerRegistry/registries@2025-11-01' existing = {
  name: acrName
}

resource containerInstance 'Microsoft.ContainerInstance/containerGroups@2026-07-01' = {
  name: containerInstanceName
  location: resourceGroup().location
  tags: tags
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${pullIdentityId}': {}
    }
  }
  properties: {
    ipAddress: {
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
      type: 'Public'
      // Gives the instance a stable FQDN: <label>.<region>.azurecontainer.io (the IP address changes on every restart)
      dnsNameLabel: containerInstanceName
    }
    sku: 'Standard'
    osType: 'Linux'
    imageRegistryCredentials: [
      {
        server: registry.properties.loginServer
        identity: pullIdentityId
      }
    ]
    containers: [
      {
        name: 'container-${containerInstanceName}'
        properties: {
          image: '${registry.properties.loginServer}/maartenvandiemen/eshoponwebmvc:latest'        
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
          ]
          environmentVariables: [
            {
              name: 'ASPNETCORE_ENVIRONMENT'
              value: 'Docker'
            }
            {
              name: 'UseOnlyInMemoryDatabase'
              value: 'true'
            }
            {
              name: 'ASPNETCORE_HTTP_PORTS'
              value: '80'
            }
            {
              // No Seq server is deployed; without this the app fails to start ("Unable to add a Seq health check because the 'ServerUrl' setting is missing")
              name: 'Aspire__Seq__DisableHealthChecks'
              value: 'true'
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 2
            }
          }
        }
      }
    ]
  }
}

@description('Fully qualified domain name of the container instance')
output fqdn string = containerInstance.properties.ipAddress.fqdn
