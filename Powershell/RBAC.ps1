# MSDN Subscription and Tenant
Clear-AzContext -Scope CurrentUser -Force
Connect-AzAccount
Get-AzContext

Get-AzRoleDefinition | Format-Table Name, Description
Get-AzRoleDefinition -Name "virtual machine contributor" | ConvertTo-Json | Out-File "C:\Users\ziyzhang\Documents\Demo\role_vmcontributor.json"

# Edit the built-in role above, save as new JSON "customrole_vmcontributor"
# CHANGE ROLE NAME i.e. Custom Virtual Machine Contributor
# ADD SUBCRIPTION UNDER ASSIGNABLE SCOPES i.e. /subscriptions/70fa0bce-97c4-4c41-a090-067ab5beee75
$subscription = Get-AzSubscription -SubscriptionName "Visual Studio Enterprise"
$scope = "/subscriptions/" + $subscription.id

New-AzRoleDefinition -InputFile C:\Users\ziyzhang\Documents\Demo\customrole_vmcontributor.json

$resourceGroupName = "AAAG"
New-AzRoleAssignment -ResourceGroupName $resourceGroupName -SignInName "yoko@bennytech.net" -RoleDefinitionName "Custom Virtual Machine Contributor"
New-AzRoleAssignment -Scope $scope -SignInName "yoko@bennytech.net" -RoleDefinitionName "Network Contributor"

# View role assignments
Get-AzRoleAssignment