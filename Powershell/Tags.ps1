# MSDN Subscription and Tenant
Clear-AzContext -Scope CurrentUser -Force
Connect-AzAccount
Get-AzContext

$resourceGroupName = "AAAG"

# Add tags to RG that has no tags
Set-AzResourceGroup -Name $resourceGroupName -Tag ${Dept="IT"; Environment="Test"}

# Update tags to existing RG that has tags
$tags = (Get-AzureResourceGroup -Name $resourceGroupName).Tag
$tags += ${Status="Approved"}
Set-AzResourceGroup -Name $resourceGroupName -Tag $tags

$resourceName = "AAAG-vm"

#Add tags to specific resource without tags
$r = Get-AzResource -ResourceName $resourceName -ResourceGroupName $resourceGroupName
Set-AzResource -ResourceId $r.ResourceId -Tag ${Dept="CostCentre", Environment="12345"} -Force