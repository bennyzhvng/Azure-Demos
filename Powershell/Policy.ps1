# MSDN Subscription and Tenant
Clear-AzContext -Scope CurrentUser -Force
Connect-AzAccount
Get-AzContext

# $subscription = Get-AzSubscription -SubscriptionName "Visual Studio Enterprise"
# $scope = "/subscriptions/" + $subscription.id
$resourceGroupName = "AAAG"
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName
$scope = $resourceGroup.ResourceId

# Create the Policy Definition
$definition = New-AzPolicyDefinition -Name "allowed-locations" -DisplayName "Allowed Locations" -description "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region." -Policy 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/built-in-policy/allowed-locations/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/built-in-policy/allowed-locations/azurepolicy.parameters.json' -Mode Indexed
# Set the Policy Parameter (JSON format)
$policyparam = '{ "listOfAllowedLocations": { "value": [ "australiasoutheast", "australiaeast" ] } }'


# Create the Policy Assignment
New-AzPolicyAssignment -Name 'allowed-locations-assignment' -DisplayName 'Allowed locations Assignment' -Scope $scope -PolicyDefinition $definition -PolicyParameter $policyparam